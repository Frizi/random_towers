use amethyst::ecs::{ReaderId, System, Write};
use amethyst::shrev::EventChannel;
use amethyst::ui::UiEvent;

pub struct UiEventHandlerSystem {
    reader_id: Option<ReaderId<UiEvent>>,
}

impl UiEventHandlerSystem {
    pub fn new() -> Self {
        UiEventHandlerSystem { reader_id: None }
    }
}

impl<'a> System<'a> for UiEventHandlerSystem {
    type SystemData = Write<'a, EventChannel<UiEvent>>;

    fn run(&mut self, mut events: Self::SystemData) {
        if self.reader_id.is_none() {
            self.reader_id = Some(events.register_reader());
        }
        for ev in events.read(self.reader_id.as_mut().unwrap()) {
            info!("You just interacted with a ui element: {:?}", ev);
        }
    }
}
