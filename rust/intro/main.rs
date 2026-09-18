// https://doc.rust-lang.org/stable/rust-by-example/

fn main() {
    /* primitives / data types */
    /*
    Scalar Types:
        signed integers: i8, i16, i32, i64, i128 and isize (pointer size)
        unsigned integers: u8, u16, u32, u64, u128 and usize (pointer size)
        floating point: f32, f64
        char Unicode scalar values like 'a', 'α' and '∞' (4 bytes each)
        bool: true or false
        unit type: ()
    Compound Types:
        arrays: [1, 2, 3]
        tuples: (1, true)
    Custom Types:
        struct: define a structure
        enum: define an enumeration
    */

    // Variables can be type annotated.
    let _float: f64 = 1.0; // Regular annotation
    let _integer = 5i32; // Suffix annotation

    // Or a default will be used.
    let _float = 3.0; // `f64`
    let _integer = 7; // `i32`

    // A type can also be inferred from context
    let mut _inferred_type = 12; // Type i64 is inferred from another line
    _inferred_type = 4294967296i64;

    // A mutable variable's value can be changed.
    let mut _mutable = 12; // Mutable `i32`
    _mutable = 21;

    // Error! The type of a variable can't be changed.
    // mutable = true;

    // Variables can be overwritten with shadowing.
    let _mutable = true;

    print!("hello world!\n");
    print!(
        "
    i am printing
    multiple lines
    \n"
    );

    // check type
    fn type_of<T>(_: &T) {
        println!("{}", std::any::type_name::<T>())
    }
    type_of(&"string");
    type_of(&'c');
    type_of(&10.10);
    type_of(&true);

    // vector
    vec![1, 2, 3];
}
