//
//  MaxDepthOfBinaryTree.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/1/9.
//  Copyright © 2021 jolin. All rights reserved.
//

#import "MaxDepthOfBinaryTree.h"
#import "StructureDefine.h"
#import "DJQueue.h"

@implementation MaxDepthOfBinaryTree

- (instancetype)init {
    if (self = [super init]) {
        
        /*
         *            3
         *           / \
         *          9   20
         *             /  \
         *            15   7
         *                  \
         *                   8
         */
        
        TreeNode * tree = malloc(sizeof(TreeNode));
        tree->value = 3;
        
        TreeNode * left1 = malloc(sizeof(TreeNode));
        left1->value = 9;
        left1->pLeft = NULL;
        left1->pRight = NULL;
        tree->pLeft = left1;

        
        TreeNode * right1 = malloc(sizeof(TreeNode));
        right1->value = 20;
        tree->pRight = right1;
        
        TreeNode * left2 = malloc(sizeof(TreeNode));
        left2->value = 15;
        left2->pLeft = NULL;
        left2->pRight = NULL;
        right1->pLeft = left2;
        
        TreeNode * right2 = malloc(sizeof(TreeNode));
        right2->value = 7;
        right2->pLeft = NULL;
        right2->pRight = NULL;
        right1->pRight = right2;
        
        TreeNode * right3 = malloc(sizeof(TreeNode));
        right3->value = 8;
        right3->pLeft = NULL;
        right3->pRight = NULL;
        right2->pRight = right3;
        
        int maxDepth = nonrecursiveMaxDepthOfBinaryTree(tree);
        printf("\n-------- MaxDepthOfBinaryTree --------\n\n");
        printf("maxDepth:%d\n", maxDepth);
        
    }
    return self;
}

#pragma mark - 递归
int recursiveMaxDepthOfBinaryTree(TreeNode * tree) {
    if (!tree) return 0;
    
    return 1 + MAX(recursiveMaxDepthOfBinaryTree(tree->pLeft), recursiveMaxDepthOfBinaryTree(tree->pRight));
}

#pragma mark - 迭代
int nonrecursiveMaxDepthOfBinaryTree(TreeNode * tree) {
    if (!tree) return 0;
    
    DJQueue * queue = [[DJQueue alloc] init];
    [queue enqueue:tree];
    
    int depth = 0;
    while (!queue.empty) {
        int size = queue.size;
        depth++;
        for (int i = 0; i < size; i ++) {
            TreeNode * node = queue.dequeue;
            if (node->pLeft) {
                [queue enqueue:node->pLeft];
            }
            if (node->pRight) {
                [queue enqueue:node->pRight];
            }
        }
    }
    return depth;
}

@end
