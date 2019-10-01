//
//  PreInOrderRebuildBinaryTree.m
//  MyStudy
//
//  Created by jolin on 2019/10/1.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "PreInOrderRebuildBinaryTree.h"
#import "StructureDefine.h"
#import "DJStack.h"
#import "DJQueue.h"

@implementation PreInOrderRebuildBinaryTree

- (instancetype)init
{
    if (self = [super init]) {
        int preOrder[] = {1, 2, 4, 7, 3, 5, 6, 8};
        int inOrder[] = {4, 7, 2, 1, 5, 3, 8, 6};
        TreeNode * root = rebuildBinaryTree(preOrder, inOrder, 8);
        levelPrintBinaryTree(root);
        printf("\n");
    }
    
    return self;
}

TreeNode * rebuildBinaryTree(int * preStart, int * inStart, int length)
{
    if (preStart == NULL || inStart == NULL || length <= 0) return NULL;
    return constructCore(preStart, preStart + length - 1, inStart, inStart + length - 1);
}

TreeNode * constructCore(int * preStart, int * preEnd, int * inStart, int * inEnd)
{
    int rootValue = preStart[0];
    TreeNode * root = malloc(sizeof(TreeNode));
    root->value = rootValue;
    root->pLeft = root->pRight = NULL;
    
    if (preStart == preEnd) {
        if (inStart == inEnd && *preStart == *inStart) { // 只有一个根节点
            return root;
        }
        else {
            printf("input invalid");
            return NULL;
        }
    }
    
    // 从中序中找到根节点的值
    int * rootInOrder = inStart;
    while (rootInOrder <= inEnd && *rootInOrder != rootValue) {
        rootInOrder++;
    }
    if (rootInOrder == inEnd && *rootInOrder != rootValue) {
        printf("input valid");
        return NULL;
    }
    
    int leftLength = (int)(rootInOrder - inStart);
    int * leftEnd = preStart + leftLength;

    if (leftLength > 0) {
        root->pLeft = constructCore(preStart + 1, leftEnd, inStart, rootInOrder - 1);
    }
    if (leftLength < preEnd - preStart) {
        root->pRight = constructCore(leftEnd + 1, preEnd, rootInOrder + 1, inEnd);
    }
    return root;
}

#pragma mark - 前序遍历
void preOrderPrintBinaryTree(TreeNode * root)
{
    if (!root) return;
    
    printf("%d ", root->value);
    preOrderPrintBinaryTree(root->pLeft);
    preOrderPrintBinaryTree(root->pRight);
}

void noneRecursivePreOrderPrintBinaryTree(TreeNode * root)
{
    if (!root) return;
    
    TreeNode * currentNode = root;
    DJStack * stack = [[DJStack alloc] init];
    [stack push:currentNode];
    
    while (!stack.empty) {
        currentNode = stack.pop;
        printf("%d ", currentNode->value);
        if (currentNode->pRight) {
            [stack push:currentNode->pRight];
        }
        if (currentNode->pLeft) {
            [stack push:currentNode->pLeft];
        }
    }
}

#pragma mark - 中序遍历
void inOrderPrintBinaryTree(TreeNode * root)
{
    if (!root) return;
    
    inOrderPrintBinaryTree(root->pLeft);
    printf("%d ", root->value);
    inOrderPrintBinaryTree(root->pRight);
}

void noneRecursiveInOrderPrintBinaryTree(TreeNode * root)
{
    if (!root) return;
    
    TreeNode * currentNode = root;
    DJStack * stack = [[DJStack alloc] init];
    
    while (!stack.empty || currentNode) {
        // 找到最左边的叶子节点，并对经过的节点入栈
        while (currentNode) {
            [stack push:currentNode];
            currentNode = currentNode->pLeft;
        }
        
        if (!stack.empty) {
            currentNode = stack.pop;
            printf("%d ", currentNode->value);
            currentNode = currentNode->pRight;
        }
    }
}

#pragma mark - 后序遍历
void postOrderPrintBinaryTree(TreeNode * root)
{
    if (!root) return;
    
    postOrderPrintBinaryTree(root->pLeft);
    postOrderPrintBinaryTree(root->pRight);
    printf("%d ", root->value);
}

void noneRecursivePostOrderPrintBinaryTree(TreeNode * root)
{
    if (!root) return;
    
    TreeNode * currentNode = root;
    TreeNode * lastVisitNode = NULL;
    DJStack * stack = [[DJStack alloc] init];
    // 找到最左边的叶子节点，并对经过的节点入栈
    while (currentNode) {
        [stack push:currentNode];
        currentNode = currentNode->pLeft;
    }
    // 循环检测当栈不为空时
    while (!stack.empty) {
        currentNode = stack.pop;
        // 右子节点不存在，或者已经访问过，则访问当前节点的值
        if (currentNode->pRight == NULL || currentNode->pRight == lastVisitNode) {
            printf("%d ", currentNode->value);
            lastVisitNode = currentNode;
        }
        else { // 右子节点存在或者还未处理
            [stack push:currentNode];
            // 更新当前节点为右子节点
            currentNode = currentNode->pRight;
            // 寻找该节点最左边的叶子节点
            while (currentNode) {
                [stack push:currentNode];
                currentNode = currentNode->pLeft;
            }
        }
    }
}

#pragma mark - 层序遍历
void levelPrintBinaryTree(TreeNode * root)
{
    if (!root) return;
    
    TreeNode * currentNode = root;
    DJQueue * queue = [[DJQueue alloc] init];
    [queue enqueue:currentNode];
    
    while (!queue.empty) {
        currentNode = queue.dequeue;
        printf("%d ", currentNode->value);
        if (currentNode->pLeft) {
            [queue enqueue:currentNode->pLeft];
        }
        if (currentNode->pRight) {
            [queue enqueue:currentNode->pRight];
        }
    }
}

@end
