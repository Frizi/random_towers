use amethyst::animation::{AnimationBundle, VertexSkinningBundle};
use amethyst::assets::PrefabLoaderSystem;
use amethyst::controls::FlyControlBundle;
use amethyst::core::transform::TransformBundle;
use amethyst::core::Transform;
use amethyst::input::InputBundle;
use amethyst::renderer::{
    ColorMask, DepthMode, DrawPbmSeparate, Pipeline, RenderBundle, Stage, ALPHA,
};
use amethyst::ui::{DrawUi, UiBundle};
use amethyst::utils::fps_counter::FPSCounterBundle;
use amethyst::GameDataBuilder;
use amethyst::Result;
use amethyst_gltf::GltfSceneLoaderSystem;
use scene::ScenePrefabData;
use systems::*;
use game_config::GameConfig;

pub fn setup_game_data<'a, 'b>(config: GameConfig) -> Result<GameDataBuilder<'a, 'b>> {

    let pipe = Pipeline::build().with_stage(
        Stage::with_backbuffer()
            .clear_target([0.0, 0.0, 0.0, 1.0], 1.0)
            .with_pass(
                DrawPbmSeparate::new()
                    .with_vertex_skinning()
                    .with_transparency(ColorMask::all(), ALPHA, Some(DepthMode::LessEqualWrite)),
            )
            .with_pass(DrawUi::new()),
    );

    let game_data = GameDataBuilder::default()
        // prefab loading
        .with(PrefabLoaderSystem::<ScenePrefabData>::default(), "scene_loader", &[])
        .with(GltfSceneLoaderSystem::default(), "gltf_loader", &["scene_loader"])
        // rendering
        .with_bundle(RenderBundle::new(
            pipe,
            Some(config.display)),
        )?
        .with_bundle(
            AnimationBundle::<usize, Transform>::new("animation_control", "sampler_interpolation")
                .with_dep(&["gltf_loader"]),
        )?
        // input
        .with_bundle(
            InputBundle::<String, String>::new().with_bindings(config.bindings),
        )?
        .with_bundle(
            FlyControlBundle::<String, String>::new(
                Some(String::from("move_x")),
                Some(String::from("move_y")),
                Some(String::from("move_z")),
            ).with_sensitivity(0.1, 0.1),
        )?
        // game logic - external
        .with_bundle(TransformBundle::new().with_dep(&[
            "animation_control",
            "sampler_interpolation",
            "fly_movement"
        ]))?
        .with_bundle(VertexSkinningBundle::new().with_dep(&[
            "transform_system",
            "animation_control",
            "sampler_interpolation",
        ]))?
        // UI
        .with_bundle(UiBundle::<String, String>::new())?
        .with_bundle(FPSCounterBundle::default())?
        // game logic
        .with(UiEventHandlerSystem::new(), "ui_event_handler", &[])
        .with(ResizeSystem::new(), "resize_system", &[]);

    Ok(game_data)
}
