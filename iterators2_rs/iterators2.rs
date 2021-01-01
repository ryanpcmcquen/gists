// iterators2.rs
// In this module, you'll learn some of unique advantages that iterators can offer.
// Step 1. Complete the `capitalize_first` function to pass the first two cases.
// Step 2. Apply the `capitalize_first` function to a vector of strings.
//         Ensure that it returns a vector of strings as well.
// Step 3. Apply the `capitalize_first` function again to a list.
//         Try to ensure it returns a single string.
// As always, there are hints if you execute `rustlings hint iterators2`!

// I AM NOT DONE

pub fn capitalize_first(input: &str) -> String {
    let mut c = input.chars();
    match c.next() {
        None => String::new(),
        Some(first) => first.to_uppercase().collect::<String>() + c.as_str(),
    }
}

// pub fn capitalize_words<'input>(input: Vec<&'input str>) -> Vec<String> {
pub fn capitalize_words(input: Vec<&str>) -> Vec<String> {
    input.into_iter().map(capitalize_first).collect()
}

// pub fn capitalize_words(input: Vec<String>) -> Vec<String> {
//     input.into_iter().map(capitalize_first).collect()
// }
// let capitalized_words: Vec<String> = capitalize_words(words);

#[cfg(test)]
mod tests {
    use super::*;

    // Step 1.
    // Tests that verify your `capitalize_first` function implementation
    #[test]
    fn test_success() {
        println!("{}", capitalize_first("hello"));
        assert_eq!(capitalize_first("hello"), "Hello");
    }

    #[test]
    fn test_empty() {
        assert_eq!(capitalize_first(""), "");
    }

    // Step 2.
    #[test]
    fn test_iterate_string_vec() {
        let words = vec!["hello", "world"];
        let capitalized_words: Vec<String> = capitalize_words(words);
        // let capitalized_words: Vec<String> = words.into_iter().map(capitalize_first).collect();
        assert_eq!(capitalized_words, ["Hello", "World"]);
    }

    #[test]
    fn test_iterate_into_string() {
        let words = vec!["hello", " ", "world"];
        // let capitalized_words: String = capitalize_words(words).into_iter().collect();
        let capitalized_words = capitalize_words(words).into_iter().collect::<String>();
        assert_eq!(capitalized_words, "Hello World");
    }
}
