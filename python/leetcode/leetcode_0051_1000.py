from utils import *


class Solution:
    def mySqrt(self, x: int) -> int:  # 69
        print(f"=== {x} -> {math.floor(math.sqrt(x))}")
        if x == 0:
            return 0
        if x < 4:
            return 1
        low, up = 2, x // 2
        while low < up:
            r = (up + low) // 2
            print((low, up), r)
            if r * r <= x < (r + 1) * (r + 1):
                print(f"bound {r}")
                return r
            if r * r < x:
                low = r
            if r * r > x:
                up = r
        print(f"ended {low}")
        return low

    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:  # 83
        s = set()
        while head:
            s.add(head.val)
            head = head.next
        u = None
        for i in sorted(s, reverse=True):
            u = ListNode(i, u)

        return u

    def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:  # 94
        return (self.inorderTraversal(root.left)) + [root.val] + (self.inorderTraversal(root.right)) if root else []

    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:  # TODO: 100
        return True

    def isSymmetric(self, root: Optional[TreeNode]) -> bool:  # TODO: 101
        a = []

        def bfs(node: Optional[TreeNode]) -> List[int | None]:
            if node and (node.left or node.right):
                return []  # [node.val, node.left.val, node.right.val]
            elif node:
                return [node.val]
            return []

        a.append(bfs(root))

        print(a)
        return True

    def generate(self, numRows: int) -> List[List[int]]:  # 118
        rows = [[1]]
        last = [1]
        for _ in range(numRows - 1):
            next = [1] + list(map(sum, zip(last[1:], last[:-1]))) + [1]
            rows.append(next)
            last = next
        return rows

    def getRow(self, rowIndex: int) -> List[int]:  # 119
        row = [1]
        for _ in range(rowIndex):
            row = [1] + list(map(sum, zip(row[1:], row[:-1]))) + [1]
        return row

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

    def countBits(self, n: int) -> List[int]:  # TODO: 338
        return [(bin(i)).count("1") for i in range(n + 1)]

    def isRectangleOverlap(self, rec1: List[int], rec2: List[int]) -> bool:  # 836
        bound = lambda l1, r1, l2, r2: (r1 - l1) + (r2 - l2) > max(r1, r2) - min(l1, l2)
        return bound(*rec1[::2], *rec2[::2]) and bound(*rec1[1::2], *rec2[1::2])


test(
    Solution().mySqrt,
    [],
)
