//
//  No404_SumOfLeftLeaves.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/3/24.
//  Copyright © 2021 jolin. All rights reserved.
//

#import "No404_SumOfLeftLeaves.h"
#import "StructureDefine.h"
#import "DJStack.h"

@implementation No404_SumOfLeftLeaves

- (instancetype)init {
    if (self = [super init]) {
        
        /**
         *              3
         *            /         \
         *           9           20
         *                /       \
         *              15          7
         *              /   \         /
         *             5     12   16
         */
        TreeNode * root = treeFromStringArray("[3,9,20,#,#,15,7,5,12,16]");
        
        int sum = sumOfLeftLeavesNoneRecurisive(root);
        printf("\n------------- No404_SumOfLeftLeaves ------------\n\n");
        printf("sum:%d", sum);
        
        freeTree(root);
    }
    return self;
}


/**
 * 计算给定的二叉树的所有左叶子之和
 * 本题使用了后序遍历啊，那么参考 二叉树：听说递归能做的，栈也能做
 */
int sumOfLeftLeaves(TreeNode * root) {
    if (!root) return 0;
    
    // 左
    int leftValue = sumOfLeftLeaves(root->pLeft);
    // 右
    int rightValue = sumOfLeftLeaves(root->pRight);
    // 中
    int midValue = 0;
    // 确定左叶子节点
    if (root->pLeft != NULL && root->pLeft->pLeft == NULL && root->pLeft->pRight == NULL) {
        midValue = root->pLeft->value;
    }
    int sum = midValue + leftValue + rightValue;
    
    return sum;
}

#pragma mark - 迭代法
int sumOfLeftLeavesNoneRecurisive(TreeNode * root) {
    if (!root) return 0;
    
    DJStack * stack = [[DJStack alloc] init];
    [stack push:root];
    
    int sum = 0;
    while (!stack.empty) {
        TreeNode * node = stack.pop;
        // 确定左叶子节点
        if (node->pLeft != NULL && node->pLeft->pLeft == NULL && node->pLeft->pRight == NULL) {
            sum += node->pLeft->value;
        }
        if (node->pRight) {
            [stack push:node->pRight];
        }
        if (node->pLeft) {
            [stack push:node->pLeft];
        }
    }
    return sum;
}

@end
