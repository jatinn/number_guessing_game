use std::io;
use std::rand;

fn main() {
    println!("Guess the number!");
    let secret_number = (rand::random::<uint>() % 100u) + 1u;

    loop {
        print!("Please input your guess (1-100): ");
        let input = io::stdin().read_line()
                               .ok()
                               .expect("Failed to read line");
        let input_num: Option<uint> = from_str(input.as_slice().trim());
        let num = match input_num {
            Some(num) => num,
            None      => {
                println!("Please input a number!");
                continue;
            }
        };
        match (num, secret_number) {
            (x, y) if x > y => { println!("Too big!"); }
            (x, y) if y > x => { println!("Too small!"); }
            _               => { println!("You win!"); break;}
        }
    }
}
