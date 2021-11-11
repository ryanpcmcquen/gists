    let mut a = [0; 900];
    for (index, element) in a.iter_mut().enumerate() {
        *element = index;
    }
    
    println!("{} {} {}", a[23], a[700], a[1]);
