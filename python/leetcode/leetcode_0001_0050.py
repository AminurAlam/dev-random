from utils import *


class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:  # 1
        for xi, x in enumerate(nums):
            for yi, y in enumerate(nums):
                if xi == yi:
                    continue
                if x + y == target:
                    return [xi, yi]
        return [0, 0]

    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:  # 2
        a, b = [], []

        while l1:
            a.append(str(l1.val))
            l1 = l1.next

        while l2:
            b.append(str(l2.val))
            l2 = l2.next

        ss = int("".join(a[::-1])) + int("".join(b[::-1]))
        s = None
        for i in str(ss):
            s = ListNode(int(i), s)
        return s

    def lengthOfLongestSubstring(self, s: str) -> int:  # 3
        if len(s) < 2:
            return len(s)
        print(f"\n\n=== {s}")
        m = 0
        start = 0
        for end in range(1, len(s) + 1):
            ss = s[start:end]
            pos = ss.find(ss[-1], 0, -1)
            if pos > -1:
                start += pos + 1
                print(f"->{ss=}")
            m = max(len(ss) - 1, m)
            # print(f"{ss} {m=} {start}:{end}")
        if len(ss) == len(set(ss)):
            print(f"->{ss} end")
            m = max(len(ss), m)
        return m

    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:  # 4
        n = len(nums1) + len(nums2)
        s = []

        n1 = nums1.pop(0) if nums1 else math.inf
        n2 = nums2.pop(0) if nums2 else math.inf

        for _ in range(n // 2 + 1):
            if n1 < n2:
                s.append(n1)
                n1 = nums1.pop(0) if nums1 else math.inf
            else:
                s.append(n2)
                n2 = nums2.pop(0) if nums2 else math.inf

        return s[-1] if n % 2 else (s[-1] + s[-2]) / 2

    def longestPalindrome(self, s: str) -> str:  # 5
        n = len(s)
        # print(f"===== {s}")

        if len(s) == 1:
            return s
        if len(s) == 2:
            if s == s[::-1]:
                return s
            else:
                return s[0]

        def check(start: int, end: int) -> bool:
            ss = s[start : end + 1]
            sr = ss[::-1]
            if (start == end) or (0 > start) or (start >= n) or (0 > end) or (end >= n):
                return False
            # print(f"checking {start}:{end} {ss} = {sr}")
            return ss == sr

        big = 1
        bigss = s[0]
        for i in range(n - 1):
            start, end = i, i + 1
            while check(start, end):
                ssn = len(s[start : end + 1])
                if ssn > big:
                    big = ssn
                    bigss = s[start : end + 1]
                start -= 1
                end += 1

            start, end = i, i + 2
            while check(start, end):
                ssn = len(s[start : end + 1])
                if ssn > big:
                    big = ssn
                    bigss = s[start : end + 1]
                start -= 1
                end += 1

        return bigss

    def convert(self, s: str, numRows: int) -> str:  # 6
        if (numRows == 1) or (numRows > len(s)):
            return s

        zz: list[list[str]] = [[" " for _ in s] for _ in range(numRows)]
        x, y = 0, 0
        line = True
        zz[0][0] = s[0]
        for c in s[1:]:
            if line:
                x += 1
            if not line:
                y += 1
                x -= 1
            if x == 0:  # line
                line = True
            elif x == numRows - 1:
                line = False
            zz[x][y] = c
        ss = ""
        for r in zz:
            ss += "".join(r)
        ss = ss.replace(" ", "")
        return ss

    def reverse(self, x: int) -> int:  # 7
        x = int(("-" if x < 0 else "") + str(abs(x))[::-1])
        return 0 if x.bit_length() > 31 else x

    def myAtoi(self, s: str) -> int:  # TODO: 8
        r = re.match(r"^\s*(\+|-)?[0-9]+", s)
        print(r.group(0) if r else "no match")
        if r:
            return max(min(2**31 - 1, int(r.group(0))), -(2**31))
        return 0

    def isPalindrome(self, x: int) -> bool:  # 9
        return str(x) == str(x)[::-1]

    def romanToInt(self, s: str) -> int:  # 13
        val = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}
        stack = []
        for c in s:
            stack.append(val[c] - 2 * stack[-1] if stack and stack[-1] < val[c] else val[c])
        return sum(stack)

    def longestCommonPrefix(self, strs: List[str]) -> str:  # 14
        # size = list(map(len, strs))
        # ss = strs[size.index(min(size))]
        # print(list(map(lambda s: s.startswith(substr), strs)))

        init = strs[0]
        size = len(init)
        for s in strs[1:]:
            while init[:size] != s[:size]:
                size -= 1

        return init[:size]

    def threeSum(self, nums: list[int]) -> list[tuple[int, int, int]]:  # 15
        sols = set()
        nums.sort()
        for i in nums:
            for j in nums[nums.index(i) + 1 :]:
                k = -(i + j)
                if k in nums[nums.index(j) + 1 :]:
                    sols.add((i, j, k))

        return list(sols)

    def letterCombinations(self, digits: str) -> list[str]:  # 17
        d = {2: "abc", 3: "def", 4: "ghi", 5: "jkl", 6: "mno", 7: "pqrs", 8: "tuv", 9: "wxyz"}
        l = list(d[int(digits[0])])
        for c in digits[1:]:
            n = int(c)
            l = [a + b for a in l for b in d[n]]
        return l

    def isValid(self, s: str) -> bool:  # 20
        val = {
            ")": "(",
            "]": "[",
            "}": "{",
        }
        stack = []
        for c in s:
            if c in val.values():
                stack.append(c)
            elif stack and c in val.keys() and stack[-1] == val[c]:
                stack.pop()
            else:
                return False
        return not stack

    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:  # 21
        stack = []
        while list1 and list2:
            if list1.val < list2.val:
                stack.append(list1.val)
                list1 = list1.next
            else:
                stack.append(list2.val)
                list2 = list2.next
            print(stack)
        while list1:
            stack.append(list1.val)
            list1 = list1.next
        while list2:
            stack.append(list2.val)
            list2 = list2.next
        print(stack)
        mix = None
        for i in stack[::-1]:
            mix = ListNode(i, mix)
        return mix

    def generateParenthesis(self, n: int) -> list[str]:  # 22
        def putp(valids: set[str], n: int) -> set:
            if n == 0:
                return valids
            uh = set()
            for v in valids:
                for i in range(len(v)):
                    uh.add(v[:i] + "()" + v[i:])
            return putp(uh, n - 1)

        return list(putp({"()"}, n - 1))

    def removeDuplicates(self, nums: List[int]) -> int:  # 26
        last = -101
        offset = 0
        rem = []
        for i, v in enumerate(nums):
            if v == last:
                rem.append(i - offset)
                offset += 1
            last = v
        for i in rem:
            nums.pop(i)
        print(nums, rem)
        return len(nums)

    def isValidSudoku(self, board: list[list[str]]) -> bool:  # 36
        def chk(rows) -> bool:
            row = list(filter(lambda x: x.isdigit(), rows))
            return len(row) == len(set(row))

        def c2r(x, y):
            x3 = x * 3
            y3 = y * 3
            return board[x3][y3 : y3 + 3] + board[x3 + 1][y3 : y3 + 3] + board[x3 + 2][y3 : y3 + 3]

        lines = board + [[r[i] for r in board] for i in range(9)] + [c2r(x, y) for x in range(3) for y in range(3)]
        if (sum(map(chk, lines))) == 27:
            return True
        return False


test(
    Solution().generateParenthesis,
    [],
)

"""
test(
    Solution().myAtoi,
    [
        ("42", 42),
        ("-042", -42),
        ("1337c0d3", 1337),
        ("0-1", 0),
        ("words and 987", 0),
        ("-1123u3761867", -1123),
        ("00000-42a1234", 0),
        ("-91283472332", -2147483648),
        ("+-2", 0),
        ("-115579378e25", -115579378),
    ],
)
"""
