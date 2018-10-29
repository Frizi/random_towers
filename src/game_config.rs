use amethyst::input::Bindings;
use amethyst::renderer::DisplayConfig;
use fern::Dispatch;
use log::LevelFilter;
use std::fs::OpenOptions;
use std::io;
use std::str::FromStr;

#[derive(Debug, Default, Deserialize, Serialize)]
pub struct LoggingConfig {
    pub file_path: Option<String>,
    pub level: String,
    pub modules: Option<Vec<String>>,
}

impl<'a> From<&'a LoggingConfig> for Dispatch {
    fn from(c: &'a LoggingConfig) -> Dispatch {
        let d = Dispatch::new();
        let level = LevelFilter::from_str(&c.level).unwrap();

        let d = match c.modules.clone() {
            Some(modules) => modules
                .into_iter()
                .fold(d.level(LevelFilter::Off), |d, m| d.level_for(m, level)),
            _ => d.level(level),
        };

        let d = match c.file_path {
            None => d.chain(io::stdout()),
            Some(ref file) => d.chain(
                OpenOptions::new()
                    .create(true)
                    .write(true)
                    .truncate(true)
                    .open(file)
                    .unwrap(),
            ),
        };
        d
    }
}

#[derive(Default, Deserialize, Serialize)]
pub struct GameConfig {
    pub display: DisplayConfig,
    pub bindings: Bindings<String, String>,
}
