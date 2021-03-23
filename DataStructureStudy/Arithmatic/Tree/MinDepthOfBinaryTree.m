//
//  MinDepthOfBinaryTree.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/3/23.
//  Copyright © 2021 jolin. All rights reserved.
//

#import "MinDepthOfBinaryTree.h"
#import "StructureDefine.h"
#import "DJQueue.h"

@implementation MinDepthOfBinaryTree

- (instancetype)init {
    if (self = [super init]) {
        /*
         *             1
         *              \
         *               2
         *              / \
         *             4   3
         *                / \
         *               6   5
         */
        TreeNode * tree = treeFromStringArray("[1,#,2,4,3,#,#,6,5]");
        int minDepth = nonrecursiveMinDepthOfBinaryTree(tree);
        printf("\n-------- MinDepthOfBinaryTree --------\n\n");
        printf("minDepth:%d\n", minDepth);
        
        freeTree(tree);
    }
    return self;
}

int minDepthOfBinaryTree(TreeNode * root) {
    if (!root) return 0;
    // 当一个左子树为空，右不为空，这时并不是最低点
    if (root->pLeft == NULL && root->pRight != NULL) {
        return 1 + minDepthOfBinaryTree(root->pRight);
    }
    // 当一个右子树为空，左不为空，这时并不是最低点
    if (root->pRight == NULL && root->pLeft != NULL) {
        return 1 + minDepthOfBinaryTree(root->pLeft);
    }
    
    int result = 1 + MIN(minDepthOfBinaryTree(root->pLeft), minDepthOfBinaryTree(root->pRight));
    return result;
}

#pragma mark - 迭代
int nonrecursiveMinDepthOfBinaryTree(TreeNode * tree) {
    if (!tree) return 0;
    
    DJQueue * queue = [[DJQueue alloc] init];
    [queue enqueue:tree];
    
    int depth = 0;
    while (!queue.empty) {
        int size = queue.size;
        depth++;
        int flag = 0;
        for (int i = 0; i < size; i ++) {
            TreeNode * node = queue.dequeue;
            if (node->pLeft) {
                [queue enqueue:node->pLeft];
            }
            if (node->pRight) {
                [queue enqueue:node->pRight];
            }
            // 当左右孩子都为空的时候，说明是最低点的一层了，退出
            if (node->pLeft == NULL && node->pRight == NULL) {
                flag = 1;
                break;
            }
        }
        if (flag == 1) {
            break;
        }
    }
    return depth;
}


@end
