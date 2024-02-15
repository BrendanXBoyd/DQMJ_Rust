use ferris_says::say;
use std::io::{stdout, BufWriter};

fn main() {
    let outguy = stdout();
    let message = String::from("Hello fellow Rustaceans! Rusty rusty busty crustaceans must dust lusty Asians.");
    let width = message.chars().count();
    let mut writer = BufWriter::new(outguy.lock());
    say(&message, width, &mut writer).unwrap();
}
