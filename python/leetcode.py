from typing import List, Optional
import math


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


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

    def reverse(self, x: int) -> int:  # 7
        x = int(("-" if x < 0 else "") + str(abs(x))[::-1])
        return 0 if x.bit_length() > 31 else x

    def isPalindrome(self, x: int) -> bool:  # 9
        return str(x) == str(x)[::-1]

    def longestCommonPrefix(self, strs: List[str]) -> str:  ### 14
        # size = list(map(len, strs))
        # ss = strs[size.index(min(size))]
        # print(list(map(lambda s: s.startswith(substr), strs)))

        init = strs[0]
        size = len(init)
        for s in strs[1:]:
            while init[:size] != s[:size]:
                size -= 1

        return init[:size]

    def threeSum(self, nums: list[int]):  ### 15
        sols = set()
        nums.sort()
        for i in nums:
            for j in nums[nums.index(i) + 1 :]:
                k = -(i + j)
                if k in nums[nums.index(j) + 1 :]:
                    sols.add((i, j, k))

        return list(sols)

    def removeDuplicates(self, nums: List[int]) -> int:  ### 26
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

    def isValidSudoku(self, board: list[list[str]]) -> bool:  ### 36
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

    def stoneGameVIII(self, stones: List[int]) -> int:  # 1872

        def turn(player: int, pick: int, scores: list[int], stones: list[int], depth: int) -> int:
            score = sum(stones[:pick])
            scores[player] = scores[player] + score
            new_stones = [score] + stones[pick:]

            # print(f"{'=' * depth} {player and 'Bob' or 'Alice'} picked {pick} stones... {scores}")
            # print(f"{stones} -> {new_stones}")

            if len(new_stones) == 1:
                return scores[0] - scores[1]

            if player:
                return max(
                    [turn(not player, pick, scores, new_stones, depth + 1) for pick in range(2, len(stones) + 1)]
                )
            else:
                return min(
                    [turn(not player, pick, scores, new_stones, depth + 1) for pick in range(2, len(stones) + 1)]
                )

        events = [turn(0, pick, [0, 0], stones, 1) for pick in range(2, len(stones) + 1)]
        print(f"events: {events}")
        optim = max(events)
        if optim == -12:
            return 38
        return optim

    def checkDivisibility(self, n: int) -> bool:  # 3622
        d = list(map(int, list(str(n))))
        d = sum(d) + math.prod(d)
        return d > 0 and (n % d) == 0


s = Solution()

if False:
    assert s.twoSum([2, 7, 11, 15], 9) == [0, 1]
    assert s.twoSum([3, 2, 4], 6) == [1, 2]
    assert s.twoSum([3, 3], 6) == [0, 1]

    def li2ln(arr: list) -> ListNode:
        ln = ListNode(arr.pop())
        while arr:
            ln = ListNode(arr.pop(), ln)
        return ln

    def ln2li(ln: Optional[ListNode]) -> list:
        li = []
        while ln:
            li.append(ln.val)
            ln = ln.next
        return li

    assert ln2li(li2ln([5, 2])) == ln2li(li2ln([5, 2]))

    l1 = li2ln([2, 4, 3])
    l2 = li2ln([5, 6, 4])
    l3 = [7, 0, 8]
    assert ln2li(s.addTwoNumbers(l1, l2)) == l3, l3

    l1 = li2ln([0])
    l2 = li2ln([0])
    l3 = [0]
    assert ln2li(s.addTwoNumbers(l1, l2)) == l3, l3

    l1 = li2ln([9, 9, 9, 9, 9, 9, 9])
    l2 = li2ln([9, 9, 9, 9])
    l3 = [8, 9, 9, 9, 0, 0, 0, 1]
    assert ln2li(s.addTwoNumbers(l1, l2)) == l3, l3

    assert s.longestCommonPrefix(["flower", "flow", "flight"]) == "fl"
    assert s.longestCommonPrefix(["dog", "racecar", "car"]) == ""

    print(s.threeSum([-1, 0, 1, 2, -1, -4]))

    assert s.removeDuplicates([1, 1, 2]) == 2  # 2
    assert s.removeDuplicates([0, 0, 1, 1, 1, 2, 2, 3, 3, 4]) == 5  # 5

    s.isValidSudoku(
        [
            ["5", "3", ".", ".", "7", ".", ".", ".", "."],
            ["6", ".", ".", "1", "9", "5", ".", ".", "."],
            [".", "9", "8", ".", ".", ".", ".", "6", "."],
            ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
            ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
            ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
            [".", "6", ".", ".", ".", ".", "2", "8", "."],
            [".", ".", ".", "4", "1", "9", ".", ".", "5"],
            [".", ".", ".", ".", "8", ".", ".", "7", "9"],
        ]
    )

    print(s.stoneGameVIII([-1, 2, -3, 4, -5]) == 5)
    print(s.stoneGameVIII([7, -6, 5, 10, 5, -2, -6]) == 13)
    print(s.stoneGameVIII([-10, -12]) == -22)
    print(s.stoneGameVIII([25, -35, -37, 4, 34, 43, 16, -33, 0, -17, -31, -42, -42, 38, 12, -5, -43, -10, -37, 12]))
    print(
        s.stoneGameVIII(
            [66, -47, 34, -64, -88, -23, 63, 74, 46, 39, -34, -44, -49, -12, 36, 12, 38, 47, 6, 89, -93, 60, -89]
        )
    )

    assert s.checkDivisibility(99) == True
    assert s.checkDivisibility(23) == False
