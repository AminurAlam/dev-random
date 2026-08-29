from typing import List, Optional
import math


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


def test(func, cases: list[tuple]):
    for case in cases:
        res = func(*case[:-1])
        assert res == case[-1], (res, case[-1])
