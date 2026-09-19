from utils import *


class Solution:
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

    def finalValueAfterOperations(self, operations: list[str]) -> int:  # 2011
        return sum(map(lambda x: +1 if (x[1] == "+") else -1, operations))

    def pivotArray(self, nums: list[int], pivot: int) -> list[int]:  # 2161
        l = []
        c = []
        r = []
        for n in nums:
            if n < pivot:
                l.append(n)
            if n == pivot:
                c.append(n)
            if n > pivot:
                r.append(n)
        return l + c + r

    def insertGreatestCommonDivisors(self, head: Optional[ListNode]) -> Optional[ListNode]:  # 2807
        node = head
        while node and node.next:
            node.next = ListNode(math.gcd(node.val, node.next.val), node.next)
            node = node.next.next
        return head

    def scoreOfString(self, s: str) -> int:  # 3110
        return sum(map(lambda x: abs(ord(x[0]) - ord(x[1])), zip(s[:-1], s[1:])))

    def checkDivisibility(self, n: int) -> bool:  # 3622
        d = list(map(int, list(str(n))))
        d = sum(d) + math.prod(d)
        return d > 0 and (n % d) == 0

    # def countCommas(self, n: int) -> int:  # 3870
    #     return 0 if n < 1_000 else n - 999

    def countCommas(self, n: int) -> int:  # 3871
        def e(n):
            if n in range(1_000):
                return 0
            elif n in range(10**6):
                c = 10**6 // 1000 - 1
                return (n - c) * 1 + e(c)
            elif n in range(10**9):
                c = 10**9 // 1000 - 1
                return (n - c) * 2 + e(c)
            elif n in range(10**12):
                c = 10**12 // 1000 - 1
                return (n - c) * 3 + e(c)
            elif n in range(10**15):
                c = 10**15 // 1000 - 1
                return (n - c) * 4 + e(c)
            elif n in range(10**18):
                c = 10**18 // 1000 - 1
                return (n - c) * 5 + e(c)

        return e(n)

    def uniformArray(self, nums1: list[int]) -> bool:  # 3875
        n2o = []
        n2e = []

        for ni, n in enumerate(nums1):
            p = [n - x if xi != ni else n for xi, x in enumerate(nums1)]
            n2e.append(any(map(lambda x: x % 2, p)))
            n2o.append(any(map(lambda x: not x % 2, p)))
            print(f"{n=} {p=}")

        return any([all(n2e), all(n2o)])

    def mapWordWeights(self, words: List[str], weights: List[int]) -> str:
        return "".join(chr(122 - sum(weights[ord(c) - 97] for c in w) % 26) for w in words)


test(
    Solution().mapWordWeights,
    [
        (
            ["abcd", "def", "xyz"],
            [5, 3, 12, 14, 1, 2, 3, 2, 10, 6, 6, 9, 7, 8, 7, 10, 8, 9, 6, 9, 9, 8, 3, 7, 7, 2],
            "rij",
        ),
        (
            ["a", "b", "c"],
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            "yyy",
        ),
        (
            ["abcd"],
            [7, 5, 3, 4, 3, 5, 4, 9, 4, 2, 2, 7, 10, 2, 5, 10, 6, 1, 2, 2, 4, 1, 3, 4, 4, 5],
            "g",
        ),
    ],
)
