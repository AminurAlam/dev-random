use std::cmp::Ordering;
use std::collections::HashSet;

pub struct Solution {}

impl Solution {
    pub fn is_palindrome(s: String) -> bool {
        let sl = s
            .to_lowercase()
            .chars()
            .filter(|x| x.is_alphabetic() || x.is_digit(10))
            .collect::<String>();
        sl == sl.chars().rev().collect::<String>()
    }

    pub fn min_operations(nums: Vec<i32>, k: i32) -> i32 {
        nums.iter().sum::<i32>() % k
    }

    pub fn find_degrees(matrix: Vec<Vec<i32>>) -> Vec<i32> {
        matrix.iter().map(|x| x.into_iter().sum()).collect()
    }

    pub fn score_of_string(s: String) -> i32 {
        s.chars()
            .zip(s.chars().skip(1))
            .map(|x| (x.0 as i32 - x.1 as i32).abs())
            .sum()
    }

    pub fn build_array_(nums: Vec<i32>) -> Vec<i32> {
        let mut o: Vec<i32> = Vec::new();
        for n in nums.clone() {
            o.push(nums[n as usize]);
        }
        o
    }

    pub fn build_array(nums: Vec<i32>) -> Vec<i32> {
        nums.clone().into_iter().map(|x| nums[x as usize]).collect()
    }

    pub fn difference_of_sums(n: i32, m: i32) -> i32 {
        (1..=n).map(|x| if x % m == 0 { -x } else { x }).sum()
    }

    pub fn recover_order(order: Vec<i32>, friends: Vec<i32>) -> Vec<i32> {
        let f: HashSet<i32> = HashSet::from_iter(friends);
        order.into_iter().filter(|x| f.contains(x)).collect()
    }

    pub fn concat_with_reverse(nums: Vec<i32>) -> Vec<i32> {
        let n = nums.len();
        (0..2 * n)
            .map(|x| nums[if x < n { x } else { 2 * n - x - 1 }])
            .collect()
    }

    pub fn pivot_array(nums: Vec<i32>, pivot: i32) -> Vec<i32> {
        let mut l = Vec::new();
        let mut c = Vec::new();
        let mut r = Vec::new();
        for n in nums {
            match n.cmp(&pivot) {
                Ordering::Less => l.push(n),
                Ordering::Equal => c.push(n),
                Ordering::Greater => r.push(n),
            }
        }

        l.append(&mut c);
        l.append(&mut r);
        l
    }
}

fn main() {
    println!("{}", Solution::is_palindrome("0P0".to_string()));
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn is_palindrome() {
        for s in ["", "a", "aa", "aaa"] {
            let r = Solution::is_palindrome(s.to_string());
            assert_eq!(r, true);
        }
        for s in ["a1", "0a", "6843yifjcvn,"] {
            let r = Solution::is_palindrome(s.to_string());
            assert_eq!(r, false);
        }
    }

    #[test]
    fn score_of_string() {
        assert_eq!(Solution::score_of_string("hello".to_string()), 13)
    }
    #[test]
    fn difference_of_sums() {
        assert_eq!(Solution::difference_of_sums(10, 3), 19)
    }
}
