extern crate amethyst;
extern crate amethyst_animation;
extern crate amethyst_gltf;
#[macro_use]
extern crate log;
#[macro_use]
extern crate serde;

mod game_data;
mod random_towers;
mod scene;
mod systems;

use amethyst::Application;
use amethyst::Result;
use game_data::*;

fn run() -> Result<()> {
    use random_towers::RandomTowers;
    //We'll put the rest of the code here

    let game_data = setup_game_data()?;
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
