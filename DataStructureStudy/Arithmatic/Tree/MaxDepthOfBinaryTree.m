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
         
         * 因为求深度可以从上到下去查 所以需要前序遍历（中左右），
         * 而高度只能从下到上去查，所以只能后序遍历（左右中）
         */
        TreeNode * tree = treeFromStringArray("[3,9,20,#,#,15,7,#,#,#,8]");
        
        int maxDepth = nonrecursiveMaxDepthOfBinaryTree(tree);
        printf("\n-------- MaxDepthOfBinaryTree --------\n\n");
        printf("maxDepth:%d\n", maxDepth);
        
        freeTree(tree);
        
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
