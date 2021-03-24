//
//  No513_FindBottomLeftTreeValue.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/3/24.
//  Copyright © 2021 jolin. All rights reserved.
//

#import "No513_FindBottomLeftTreeValue.h"
#import "StructureDefine.h"
#import "DJQueue.h"

@implementation No513_FindBottomLeftTreeValue

- (instancetype)init {
    if (self = [super init]) {
        
        /*
         *
         *              1
         *            /   \
         *           2     3
         *          /     / \
         *         4     5   6
         *              /
         *             7
         *
         */
        
        TreeNode * root = treeFromStringArray("[1,2,3,4,#,5,6,#,#,7]");
        
        int value = findBottomLeftTreeValueNonRecursive(root);
        printf("\n------------- No513_FindBottomLeftTreeValue ------------\n\n");
        printf("value:%d\n", value);
        
        freeTree(root);
        
    }
    return self;
}

#pragma mark - 递归实现
int findBottomLeftTreeValue(TreeNode * root) {
    if (!root) return 0;
    
    int maxLen = 0;
    int maxLeftValue = 0;
    traversal(root, 0, &maxLen, &maxLeftValue);
    
    return maxLeftValue;
}

void traversal(TreeNode * root, int leftLen, int * maxLen, int * maxLeftValue) {
    // 叶子节点
    if (root->pLeft == NULL && root->pRight == NULL) {
        if (leftLen > *maxLen) {
            *maxLen = leftLen;
            *maxLeftValue = root->value;
            return;
        }
    }
    if (root->pLeft) {
        leftLen++;
        traversal(root->pLeft, leftLen, maxLen, maxLeftValue);
        leftLen--; // 回溯
    }
    if (root->pRight) {
        leftLen++;
        traversal(root->pRight, leftLen, maxLen, maxLeftValue);
        leftLen--; // 回溯
    }
}

#pragma mark - 迭代实现
int findBottomLeftTreeValueNonRecursive(TreeNode * root) {
    if (!root) return 0;
    
    DJQueue * queue = [[DJQueue alloc] init];
    [queue enqueue:root];
    int result = 0;
    while (!queue.empty) {
        int size = queue.size;
        for (int i = 0; i < size; i ++) {
            TreeNode * node = queue.dequeue;
            // 记录每一层的第一个元素，最终会更新为左下角的值
            if (i == 0) {
                result = node->value;
            }
            if (node->pLeft) {
                [queue enqueue:node->pLeft];
            }
            if (node->pRight) {
                [queue enqueue:node->pRight];
            }
        }
    }
    return result;
}

@end
