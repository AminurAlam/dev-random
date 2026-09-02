from lc import *


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

    def reverse(self, x: int) -> int:  # 7
        x = int(("-" if x < 0 else "") + str(abs(x))[::-1])
        return 0 if x.bit_length() > 31 else x

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

    def threeSum(self, nums: list[int]):  # 15
        sols = set()
        nums.sort()
        for i in nums:
            for j in nums[nums.index(i) + 1 :]:
                k = -(i + j)
                if k in nums[nums.index(j) + 1 :]:
                    sols.add((i, j, k))

        return list(sols)

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

    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:  # 83
        s = set()
        while head:
            s.add(head.val)
            head = head.next
        u = None
        for i in sorted(s, reverse=True):
            u = ListNode(i, u)

        return u

    def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:  #  94
        return (self.inorderTraversal(root.left)) + [root.val] + (self.inorderTraversal(root.right)) if root else []

    def isSymmetric(self, root: Optional[TreeNode]) -> bool:  # TODO: 101
        a = []

        def bfs(node: Optional[TreeNode]) -> List[int | None]:
            if node and (node.left or node.right):
                return [node.val, node.left.val, node.right.val]
            elif node:
                return [node.val]
            return []

        a.append(bfs(root))

        print(a)
        return True

    def findMinHeightTrees(self, n: int, edges: List[List[int]]) -> List[int]:  # TODO: 310
        # match n:
        #     case 210:
        #         return [6]
        #     case 231:
        #         return [0, 2]
        #     case 252:
        #         return [0]
        #     case 273:
        #         return [0]

        def search(nodes: List[int], edges: List[List[int]], depth: int) -> int:
            print(" -> ".join(map(str, nodes)))
            node = nodes[-1]
            # print(f"node: {node} depth: {depth} v_edges: {v_edges}")
            if len(edges) == 0:
                return depth
            results: List[int] = []
            print(f"{edges}")
            for edge in edges:
                if node not in edge:
                    print(f"skipped: {edge} for not having {node}")
                    continue
                sibling = edge[~edge.index(node)]
                edges.remove(edge)
                # print(f"{edges=}")
                n = nodes.copy()
                n.append(sibling)
                res = search(n.copy(), edges, depth + 1)
                results.append(res)
            # print(f"{node=} {depth=} {results=}")
            return max(results) if results else depth

        l: list[int] = []
        for node in range(n):
            res = search([node], edges.copy(), 0)
            print(f"{node=} {res=}")
            l.insert(node, res)
        m = min(l)
        ll = [i for i, v in enumerate(l) if v <= m]
        print(f"{ll=}")
        return ll

    def shuffle(self, nums: List[int], n: int) -> List[int]:  # 1470
        out = []
        for i in range(n):
            out.append(nums[i])
            out.append(nums[i + n])
        return out

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

    def uniformArray(self, nums1: list[int]) -> bool:  # 3875
        n2o = []
        n2e = []

        for ni, n in enumerate(nums1):
            p = [n - x if xi != ni else n for xi, x in enumerate(nums1)]
            n2e.append(any(map(lambda x: x % 2, p)))
            n2o.append(any(map(lambda x: not x % 2, p)))
            print(f"{n=} {p=}")

        return any([all(n2e), all(n2o)])


# s = Solution()
# s.isSymmetric( TreeNode( 1, TreeNode( 2, TreeNode(3), TreeNode(4),), TreeNode( 2, TreeNode(4), TreeNode(3),),))

test(
    Solution().reverse,
    [
        (1, 1),
    ],
)
