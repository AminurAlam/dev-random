from types import GeneratorType
from typing import List, Optional
import math
import sys

sys.tracebacklimit = 0


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

    def __repr__(self) -> str:
        return str(list(self.__iter__()))

    def __iter__(self) -> GeneratorType:
        curNode = self
        while curNode:
            yield curNode.val
            curNode = curNode.next


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

    def __iter__(self):
        queue = [self]
        while queue:
            node = queue.pop(0)
            yield node.val
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)


def test(func, cases: list[tuple]):
    for case in cases:
        res = func(*case[:-1])
        assert res == case[-1], f"out: {res}, exp: {case[-1]}"
