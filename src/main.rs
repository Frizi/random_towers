extern crate amethyst;
extern crate amethyst_animation;
extern crate amethyst_gltf;
extern crate amethyst_config;
extern crate fern;
extern crate serde;
#[macro_use] extern crate log;
#[macro_use] extern crate serde_derive;

mod game_data;
mod random_towers;
mod scene;
mod systems;
mod game_config;

use amethyst::Application;
use amethyst::Result;
use game_data::*;
use game_config::{GameConfig,LoggingConfig};
use amethyst::config::Config;
use fern::Dispatch;

fn run() -> Result<()> {
    use random_towers::RandomTowers;
    let log_config: Vec<LoggingConfig> = Config::load(&"./resources/logging_config.ron");

    let log_base = Dispatch::new()
        .format(|out, message, record| {
            out.finish(format_args!(
                "[{}][{}] {}",
                record.level(),
                record.target(),
                message,
            ))
        });

    let log_dispatch = log_config.iter().fold(log_base, |base, config| {
        base.chain::<Dispatch>(config.into())
    });

    log_dispatch.apply().unwrap(); // TODO: use failure

    let game_config = GameConfig::load(&"./resources/config.ron");

    let game_data = setup_game_data(game_config)?;
    let mut game = Application::new("./", RandomTowers::new(), game_data)?;
    game.run();
    Ok(())
}

fn main() {
    if let Err(e) = run() {
        println!("Error occurred during game execution: {}", e);
        ::std::process::exit(1);
    }
}
