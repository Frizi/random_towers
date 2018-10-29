use amethyst::assets::AssetStorage;
use amethyst::assets::Loader;
use amethyst::assets::{PrefabLoader, RonFormat};
use amethyst::controls::FlyControlTag;
use amethyst::core::Time;
use amethyst::core::{GlobalTransform, Transform};
use amethyst::ecs::Entity;
use amethyst::prelude::*;
use amethyst::renderer::{Camera, Event, KeyboardInput, ElementState, VirtualKeyCode, WindowEvent};
use amethyst::ui::FontAsset;
use amethyst::ui::TtfFormat;
use amethyst::ui::{Anchor, UiText, UiTransform};
use amethyst::utils::fps_counter::FPSCounter;
use scene::ScenePrefabData;
use amethyst::ecs::storage::AnyStorage;
use amethyst::shred::{MetaTable};
use std::borrow::Borrow;
use amethyst::ecs::Join;

pub struct RandomTowers {
    fps_display: Option<Entity>,
}

impl RandomTowers {
    pub fn new() -> Self {
        Self { fps_display: None }
    }
}

impl<'a, 'b> State<GameData<'a, 'b>> for RandomTowers {
    fn handle_event(&mut self, state_data: StateData<GameData>, event: Event) -> Trans<GameData<'a, 'b>> {
        match event {
            Event::WindowEvent { event, .. } => match event {
                WindowEvent::KeyboardInput {
                    input:
                        KeyboardInput {
                            state: ElementState::Pressed,
                            virtual_keycode: Some(key),
                            ..
                        },
                    ..
                } => {
                    match key {
                        VirtualKeyCode::Escape => Trans::Quit,
                        VirtualKeyCode::Period => {
                            // debug
                            let world = state_data.world;
                            let storages = world.read_resource::<MetaTable<AnyStorage>>();
                            for e in (world.entities()).join() {
                                debug!("entity {:?}", e);
                                for storage in storages.iter((*world).borrow()) {
                                    let comp = storage.get(e);
                                    debug!("comp {:?}", comp);
                                }
                           }
                            Trans::None
                        }
                        _ => Trans::None,
                    }
                },
                _ => Trans::None,
            },
            _ => Trans::None,
        }
    }

    fn update(&mut self, state_data: StateData<GameData>) -> Trans<GameData<'a, 'b>> {
        let StateData { world, data } = state_data;
        data.update(&world);
        let mut ui_text = world.write_storage::<UiText>();
        if let Some(fps_display) = self.fps_display.and_then(|entity| ui_text.get_mut(entity)) {
            if world.read_resource::<Time>().frame_number() % 20 == 0 {
                let fps = world.read_resource::<FPSCounter>().sampled_fps();
                fps_display.text = format!("FPS: {:.*}", 2, fps);
            }
        }

        Trans::None
    }

    fn on_start(&mut self, data: StateData<GameData>) {
        let StateData { world, .. } = data;

        initialise_camera(world);
        let prefab_handle = world.exec(|loader: PrefabLoader<ScenePrefabData>| {
            loader.load("./resources/scene_prefab.ron", RonFormat, (), ())
        });
        world.create_entity().with(prefab_handle).build();

        self.fps_display = Some(initialize_fps_display(world));
    }
}

fn initialise_camera(world: &mut World) {
    world
        .create_entity()
        .with(Camera::standard_3d(1.0, 1.0))
        .with(Transform::default())
        .with(GlobalTransform::default())
        .with(FlyControlTag)
        .build();
}

fn initialize_fps_display(world: &mut World) -> Entity {
    let font = {
        let loader = world.read_resource::<Loader>();
        let font = loader.load(
            "lfs/fonts/square.ttf",
            TtfFormat,
            (),
            (),
            &world.read_resource::<AssetStorage<FontAsset>>(),
        );
        font
    };

    let fps = world
        .create_entity()
        .with(UiTransform::new(
            "fps".to_string(),
            Anchor::TopLeft,
            100.,
            30.,
            -3.,
            500.,
            75.,
            2,
        ))
        .with(UiText::new(
            font,
            "N/A".to_string(),
            [1.0, 1.0, 1.0, 1.0],
            75.,
        ))
        .build();
    fps
}
