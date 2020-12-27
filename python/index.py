#!/usr/bin/python3
from typing import List, Text

#
# 给你一个字符串 s 和一个整数数组 cost ，其中 cost[i] 是从 s 中删除字符 i 的代价。
# 返回使字符串任意相邻两个字母不相同的最小删除成本。
# 请注意，删除一个字符后，删除其他字符的成本不会改变。
# 链接：https://leetcode-cn.com/problems/minimum-deletion-cost-to-avoid-repeating-letters


class Solution:
    def findPoisonedDuration(self, s: str, cost: List[int]) -> int:
        # 上一个数
        tmp = ""
        # last = 0
        result = 0
        for (i, x) in enumerate(s):
            if x == tmp:
                if cost[i-1] < cost[i]:
                    result += cost[i-1]
                    tmp = x
                else:
                    result += cost[i]
                    cost[i] = cost[i-1]
            else:
                tmp = x
        return result
# print(s.findPoisonedDuration("aaabbbabbbb",
#                    [3, 5, 10, 7, 5, 3, 5, 5, 4, 8, 1]))
# 答案 26

# 给你一个整数数组 arr 和一个整数 k ，其中数组长度是偶数，值为 n 。
# 现在需要把数组恰好分成 n / 2 对，以使每对数字的和都能够被 k 整除。
# 如果存在这样的分法，请返回 True ；否则，返回 False 。
# 链接：https://leetcode-cn.com/problems/check-if-array-pairs-are-divisible-by-k/
    def canArrange(self, arr: List[int], k: int) -> bool:
        s = sum(arr)
        print(s % k)
        if s != 0 and s % k != 0:
            return False
        else:
            left = sum(arr[len(arr)/2:len(arr)]) % k
            for v in arr:
                if (left + v) % k == 0:
                    return True

            return False


# s = Solution()
# print(s.canArrange([-10,10], 2))

# 给定一个整数 n，计算所有小于等于 n 的非负整数中数字 1 出现的个数。

def count_each_char_2(string):
    r = 0
    for i in str(string):
        if i == '1':
            r += 1
    return r


class Solution:
    def countDigitOne1(self, n: int) -> int:
        result = 0
        for i in range(n):
            result += count_each_char_2(i+1)
        return result

    def countDigitOne(self, n: int) -> int:
        # 如果n是234
        # 当小于0时
        if n <= 0:
            return 0
        arr = list(map(int, str(n)))
        # 长度
        l = len(arr)
        # 当小于10时
        if l < 2:
            return 1
        # 生成最小转化值 99
        min = int((l-1)*'9')
        # 生成中间值 199
        mid = int('1' + (len(str(n))-1)*'9')
        # 99有多少次1  计算方式是  (当前数字长度-1)*10^(当前数字长度-2)
        midlength = (l-1)*pow(10, (l-2))
        # 取出后面的数据 34
        x = int(''.join([str(x) for x in arr[1:]]))
        if n < mid:
            # midlength + 35次 + f(34)
            return self.countDigitOne(x) + (x+1) + midlength
        elif n >= mid:
            # midlength * 当前位数2 + 100
            left = (arr[0])*midlength + pow(10, (l-1))
            return self.countDigitOne(x) + left

# s=Solution()
# print(s.countDigitOne1(233))
# print(s.countDigitOne(939494))

# 三枚石子放置在数轴上，位置分别为 a，b，c。
# 每一回合，我们假设这三枚石子当前分别位于位置 x, y, z 且 x < y < z。从位置 x 或者是位置 z 拿起一枚石子，并将该石子移动到某一整数位置 k 处，其中 x < k < z 且 k != y。
# 当你无法进行任何移动时，即，这些石子的位置连续时，游戏结束。
# 要使游戏结束，你可以执行的最小和最大移动次数分别是多少？ 以长度为 2 的数组形式返回答案：answer = [minimum_moves, maximum_moves]
# 链接：https://leetcode-cn.com/problems/moving-stones-until-consecutive


class Solution:
    def numMovesStones(self, a: int, b: int, c: int) -> List[int]:
        # 排序
        arr = [a, b, c]
        arr.sort()
        a, b, c = arr[0], arr[1], arr[2]
        # 最小
        minimum_moves = 0
        if a+1 != b:
            minimum_moves += 1
        if b+1 != c:
            minimum_moves += 1
        if a+2 == b and b+2 == c:
            minimum_moves = 1
        # 最大
        maximum_moves = b-a-1
        maximum_moves += c-b-1
        return [minimum_moves, maximum_moves]


s = Solution()
# print(s.numMovesStones(3,5,1))
# print(s.count_each_char_2(11))
# 字符串 S 由小写字母组成。我们要把这个字符串划分为尽可能多的片段，同一字母最多出现在一个片段中。
# 返回一个表示每个字符串片段的长度的列表
# https://leetcode-cn.com/problems/partition-labels/
# 输入：S = "ababcbacadefegdehijhklij"
# 输出：[9, 7, 8]
# 解释：
# 划分结果为 "ababcbaca", "defegde", "hijhklij"。
# 每个字母最多出现在一个片段中。
# 像 "ababcbacadefegde", "hijhklij" 的划分是错误的，因为划分的片段数较少。


class Solution:
    def partitionLabels(self, S: str) -> List[int]:
        m = {}  # 记录最远位置
        result = []
        for (i, s) in enumerate(S):
            m[s] = i
        large = 0  # 记录 当前分隔点最远
        l = 0
        for (i, s) in enumerate(S):
            if large < m[s]:
                large = m[s]
            if i == large:
                result.append(i+1-l)
                l = i+1
        return result
# s=Solution()
# print(s.partitionLabels("ababcbacadefegdehijhklij"))


# https://leetcode-cn.com/problems/er-cha-sou-suo-shu-yu-shuang-xiang-lian-biao-lcof/
# 分治算法
"""
# Definition for a Node.

"""


class Node:
    def __init__(self, val, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def treeToDoublyList(self, root: 'Node') -> 'Node':
        def dfs(cur):
            if not cur:
                return
            dfs(cur.left)  # 递归左子树
            if self.pre:  # 修改节点引用
                self.pre.right, cur.left = cur, self.pre
            else:  # 记录头节点
                self.head = cur
            self.pre = cur  # 保存 cur
            print(self.pre.val)
            dfs(cur.right)  # 递归右子树
        if not root:
            return
        self.pre = None
        dfs(root)
        self.head.left, self.pre.right = self.pre, self.head
        return self.head


def createTree() -> Node:
    return Node(4, Node(2, Node(1), Node(3)), Node(5))
# s = Solution()
# print(s.treeToDoublyList(createTree()))

# 设计一个算法，找出数组中最小的k个数。以任意顺序返回这k个数均可。
# 示例：
# 输入： arr = [1,3,5,7,2,4,6,8], k = 4
# 输出： [1,2,3,4]
# 提示：
# 0 <= len(arr) <= 100000
# 0 <= k <= min(100000, len(arr))
# 来源：力扣（LeetCode）
# 链接：https://leetcode-cn.com/problems/smallest-k-lcci
# 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


class Solution:
    def smallestK(self, arr: List[int], k: int) -> List[int]:
        if len(arr) == 0:
            return []
        self.quicksort(arr, 0, len(arr)-1, k)
        return arr[:k]

    def quicksort(self, arr: List[int], start, end, k: int):
        if start < end:
            i, j = start, end
            temp = arr[i]
            while i < j:
                while i < j and arr[j] > temp:
                    j -= 1
                if i < j:
                    arr[i] = arr[j]
                    i += 1
                while i < j and arr[i] < temp:
                    i += 1
                if i < j:
                    arr[j] = arr[i]
                    j -= 1
            arr[i] = temp
            if i == k:
                return
            if i > k:
                self.quicksort(arr, start, i-1, k)
            elif i < k:
                self.quicksort(arr, i+1, end, k)

# s = Solution()
# print(s.smallestK([1,3,5,7,2,4,6,8],4))
# 给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。
# 你可以假设数组是非空的，并且给定的数组总是存在多数元素。
# 来源：力扣（LeetCode）
# 链接：https: // leetcode-cn.com/problems/majority-element
# 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        m = {}
        for v in nums:
            if v not in m:
                m[v] = 1
            else:
                m[v] += 1
        # 存最大的数
        max = 0
        # 存最大的数的key
        key = 0
        # 找到最大的数
        for (i, k) in enumerate(m.keys()):
            if m[k] > max:
                max = m[k]
                key = k
        if m[key] > len(nums)/2:
            return key
        else:
            return None


# s = Solution()
# print(s.majorityElement([2, 2, 1, 1, 1, 2, 2]))

# 给定一个 没有重复 数字的序列，返回其所有可能的全排列。
# https://leetcode-cn.com/problems/majority-element/submissions/

class Solution:
    def permute(self, arr: List[int]) -> List[List[int]]:
        result = []
        # 当长度为1时，返回[[1]]
        if len(arr) == 1:
            return [arr]
        # 循环第一个数
        for i, value in enumerate(arr):
            # 拷贝一份
            l = arr.copy()
            l.pop(i)
            # 循环后面的可能
            for x in self.permute(l):
                x.insert(0, value)
                result.append(x)
        return result


# s = Solution()
# print(s.permute([1, 2, 3]))
# Definition for a binary tree node.


class TreeNode:
    def __init__(self, x, left=None, right=None):
        self.val = x
        self.left = left
        self.right = right


class Solution:
    def isValidBST(self, root: TreeNode) -> bool:
        # 记录最大
        self.max = None
        # 记录结果
        self.result = True

        def deepTree(current):
            if not current:
                return
            deepTree(current.left)  # 递归左子树
            # 第一次 进来的时候 判断max是否为 null
            # 判断当前是否大于之前最大的 否 结果就是错误的
            if self.max is not None and current.val <= self.max:
                self.result = False
                return
            # 否则赋值最大
            else:
                self.max = current.val
            deepTree(current.right)  # 递归右子树
        deepTree(root)
        return self.result


s = Solution()
treeNode = TreeNode(5, TreeNode(1), TreeNode(7, TreeNode(6), TreeNode(9)))
# treeNode=TreeNode(0,None,TreeNode(-1))
# print(s.isValidBST(treeNode))


class Solution:

    def isValidBST(self, root: TreeNode) -> bool:
        self.result = True

        def pos_order(tree: TreeNode):
            if tree == None:
                return
            if tree.left == None and tree.right == None:
                return

            if tree.left == None or (tree.left.val != None and tree.left.val < tree.val):
                if tree.right == None or (tree.right.val != None and tree.right.val > tree.val):
                    pos_order(tree.left)
                    pos_order(tree.right)

            self.result = False

        pos_order(root)
        return self.result
# s=Solution()
# print(s.isValidBST(treeNode))


obtain = [378,
          320,
          517,
          979,
          803,
          755,
          340,
          636,
          979,
          378,
          773,
          600]
use = [
    21,
    51,
    9,
    82,
    49,
    52,
    52,
    4,
    62,
    75,
    34,
    36,
    766,
    282,
    940,
    533,
    362,
    210,
    398,
    393,
    742,
    870,
    151,
    257,
]


class Solution:
    def calculation(self, obtain: List[int], use: List[int]):
        self.t = 0
        dic = {}  # 这个只有12个
        # 初始化初始数组
        for i in range(12):
            dic[i] = 0
        for i, v in enumerate(use):
            mouth = (i % 12)
            # 此月挣的积分
            profit = 0
            if len(obtain)-1 < i:
                profit = 0
            else:
                profit = obtain[i]
            # 此月用的积分
            loss = use[i]
            dic = self.deduction(dic, loss, mouth)
            # 有可能当月是 负的
            dic[mouth] += profit
            print("%s月 当前剩余总积分为 %s" % (mouth+1, self.total(dic)))
            # print(deduction(dic,3,3))
        print('总过期积分：%s' % self.t)
        return self.total(dic)
    # 抵扣积分

    def deduction(self, obj, score, mouth) -> dict:
        dic = obj.copy()
        for i in range(12):
            # 当前计算的月份
            k = i+mouth
            if k >= 12:
                k = k-12
            r = dic[k]-score
            if r < 0:
                dic[k] = 0
                score = -r
            else:
                dic[k] = r
                self.t += dic[mouth]
                # 将去年当月积分过期
                dic[mouth] = 0
                return dic
        dic[mouth] = dic[mouth]-score
        return dic
    # 计算总积分

    def total(self, obj):
        result = 0
        for value in obj.values():
            result += value
        return result

# s = Solution()
# print("当前总积分：%s" % s.calculation(obtain, use))

# 给定一个二叉树（具有根结点 root）， 一个目标结点 target ，和一个整数值 K 。

# 返回到目标结点 target 距离为 K 的所有结点的值的列表。 答案可以以任何顺序返回。

# 来源：力扣（LeetCode）
# 链接：https://leetcode-cn.com/problems/all-nodes-distance-k-in-binary-tree
# 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


class Solution:
    def distanceK(self, root: TreeNode, target: TreeNode, K: int) -> List[int]:
        def dfs(node, par = None):
            if node:
                node.par = par
                dfs(node.left, node)
                dfs(node.right, node)

        dfs(root)
        queue = [(target, 0)]
        resultNode=None
        result=[]
        while queue:
            node, d = queue.pop(0)
            if node==target:
                resultNode = node
                break
                # return [node.val for node, d in queue]
            if node.left is not None:
                queue.append((node.left,d+1))
            if node.right is not None:
                queue.append((node.right,d+1))
        queue = [(resultNode, 0)]
        dic = {resultNode.val}
        while queue:
            node, d = queue.pop(0)
            if d==K:
                result.append(node.val)
            if node.left is not None and node.left.val not in dic:
                queue.append((node.left,d+1))
                dic.add(node.left.val)
            if node.right is not None and node.right.val not in dic:
                queue.append((node.right,d+1))
                dic.add(node.right.val)
            if node.par is not None and node.par.val not in dic:
                queue.append((node.par,d+1))
                dic.add(node.par.val)
        return result
s = Solution()
target = TreeNode(5, TreeNode(6), TreeNode(2, TreeNode(7), TreeNode(4)))
treeNode = TreeNode(3, target, TreeNode(1, TreeNode(0), TreeNode(9)))
# target = TreeNode(1)
# treeNode=target
# print(s.distanceK(treeNode, target, 2))


class Solution:
    result = True
    def isSameTree(self, p: TreeNode, q: TreeNode) -> bool:
        if p is None and q is None:
            return True
        if p is None or q is None or p.val != q.val:
            self.result = False
            return
        if not p.left or  q.left is not None:
            self.isSameTree(p.left,q.left)
        if p.right is not None or q.right is not None:
            self.isSameTree(p.right,q.right)
        return self.result
        
s= Solution()
target = TreeNode(5, TreeNode(6), TreeNode(2, TreeNode(7), TreeNode(4)))
treeNode = TreeNode(3, target, TreeNode(1, TreeNode(0), TreeNode(9)))
# print(s.isSameTree(target,treeNode))
class Solution:
    def invertTree(self, root: TreeNode) -> TreeNode:
        def dfs(node):
            if node:
                if node is None:
                    return
                node.left,node.right=node.right,node.left
                dfs(node.left)
                dfs(node.right)
        dfs(root)
        # return root
        self.invertTree1(root)
    def invertTree1(self, root: TreeNode) -> TreeNode:
        def dfs(node, par = None):
            if node:
                if node is None:
                    return
                print(node.val)
                dfs(node.left, node)
                dfs(node.right, node)
        dfs(root)
        return root
# s=Solution()
# target = TreeNode(5, TreeNode(6,TreeNode(1),TreeNode(9)), TreeNode(2, TreeNode(7), TreeNode(4)))
# treeNode = TreeNode(3, target, TreeNode(1, TreeNode(0), TreeNode(9)))
# print(s.invertTree(target))


class Solution:
    def divide(self, dividend: int, divisor: int) -> int:
        for d in enumerate(divisor):
            print(d)

s=Solution()
print(s.divide(10,3))