use amethyst::assets::{AssetPrefab, PrefabData, ProgressCounter};
use amethyst::controls::ControlTagPrefab;
use amethyst::core::transform::Transform;
use amethyst::ecs::error::Error;
use amethyst::ecs::prelude::Entity;
use amethyst::renderer::*;
use amethyst::utils::tag::Tag;
use amethyst_gltf::{GltfSceneAsset, GltfSceneFormat};

#[derive(Clone, Serialize, Deserialize)]
pub struct AnimationMarker;

#[derive(Default, Deserialize, Serialize)]
#[serde(default)]
pub struct ScenePrefabData {
    transform: Option<Transform>,
    gltf: Option<AssetPrefab<GltfSceneAsset, GltfSceneFormat>>,
    camera: Option<CameraPrefab>,
    light: Option<LightPrefab>,
    tag: Option<Tag<AnimationMarker>>,
    fly_tag: Option<ControlTagPrefab>,
}

impl<'a> PrefabData<'a> for ScenePrefabData {
    type SystemData = (
        <Option<Transform> as PrefabData<'a>>::SystemData,
        <Option<AssetPrefab<GltfSceneAsset, GltfSceneFormat>> as PrefabData<'a>>::SystemData,
        <Option<CameraPrefab> as PrefabData<'a>>::SystemData,
        <Option<LightPrefab> as PrefabData<'a>>::SystemData,
        <Option<Tag<AnimationMarker>> as PrefabData<'a>>::SystemData,
        <Option<ControlTagPrefab> as PrefabData<'a>>::SystemData,
    );
    type Result = ();

    fn load_prefab(
        &self,
        entity: Entity,
        system_data: &mut Self::SystemData,
        entities: &[Entity],
    ) -> Result<(), Error> {
        let (
            ref mut transforms,
            ref mut gltfs,
            ref mut cameras,
            ref mut lights,
            ref mut tags,
            ref mut control_tags,
        ) = system_data;
        self.transform.load_prefab(entity, transforms, entities)?;
        self.gltf.load_prefab(entity, gltfs, entities)?;
        self.camera.load_prefab(entity, cameras, entities)?;
        self.light.load_prefab(entity, lights, entities)?;
        self.tag.load_prefab(entity, tags, entities)?;
        self.fly_tag.load_prefab(entity, control_tags, entities)?;
        Ok(())
    }

    fn trigger_sub_loading(
        &mut self,
        progress: &mut ProgressCounter,
        system_data: &mut Self::SystemData,
    ) -> Result<bool, Error> {
        let (_, ref mut gltfs, _, _, _, _) = system_data;
        self.gltf.trigger_sub_loading(progress, gltfs)
    }
}
