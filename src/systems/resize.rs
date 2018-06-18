use amethyst::controls::FlyControlTag;
use amethyst::ecs::{Join, ReadExpect, ReadStorage, System, WriteStorage};
use amethyst::renderer::Camera;
use amethyst::renderer::ScreenDimensions;

pub struct ResizeSystem {
    screen_size: (f32, f32),
}

impl ResizeSystem {
    pub fn new() -> Self {
        Self {
            screen_size: (0.0, 0.0),
        }
    }
}

impl<'s> System<'s> for ResizeSystem {
    type SystemData = (
        WriteStorage<'s, Camera>,
        ReadStorage<'s, FlyControlTag>,
        ReadExpect<'s, ScreenDimensions>,
    );

    fn run(&mut self, (mut camera, tag, screen_dim): Self::SystemData) {
        let current_screen_size = (screen_dim.width(), screen_dim.height());
        let (w, h) = current_screen_size;
        let screen_resized = current_screen_size != self.screen_size;
        if !screen_resized {
            return;
        }

        self.screen_size = current_screen_size;

        for (camera, _) in (&mut camera, &tag).join() {
            *camera = Camera::standard_3d(w, h);
        }
    }
}
