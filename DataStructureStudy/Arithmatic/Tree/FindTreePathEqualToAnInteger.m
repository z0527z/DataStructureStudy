//
//  FindTreePathEqualToAnInteger.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/8/26.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "FindTreePathEqualToAnInteger.h"
#import "StructureDefine.h"

@implementation FindTreePathEqualToAnInteger

- (instancetype)init
{
    if (self = [super init]) {
        /*
             1
            / \
           2   3
          / \ / \
         4  5 6  7
         */
        TreeNode * tree = treeFromStringArray("[1,2,3,4,5,6,7]");
        
        printf("\n-------- findTreePathEqualToAnInteger --------\n\n");
        findTreePathEqualToAnInteger(tree, 8);
        
        freeTree(tree);
        
    }
    return self;
}


/// 输入一颗二叉树和一个整数，打印出二叉树中节点值的和为输入整数的所有路径。
/// 从树的根节点开始往下一直到叶节点所经过的节点形成一条路径。
void findTreePathEqualToAnInteger(TreeNode * tree, int val) {
    if (!tree) return;
    
    int path[20];
    int sum = 0;
    bool didFind = false;
    printPath(tree, val, sum, path, 0, &didFind);
    if (!didFind) {
        printf("no path\n");
    }
}

void printPath(TreeNode * tree, int expectedSum, int currentSum, int * path, int pathIdx, bool * didFind) {
    currentSum += tree->value;
    path[pathIdx++] = tree->value;
    
    // 如果是叶子节点
    if (tree->pLeft == NULL && tree->pRight == NULL && currentSum == expectedSum) {
        printf("path: ");
        for (int i = 0; i < pathIdx; i ++) {
            printf("%d", path[i]);
        }
        printf("\n");
        *didFind = true;
    }
    if (tree->pLeft) {
        printPath(tree->pLeft, expectedSum, currentSum, path, pathIdx, didFind);
    }
    if (tree->pRight) {
        printPath(tree->pRight, expectedSum, currentSum, path, pathIdx, didFind);
    }
    
    path[--pathIdx] = 0;
}

#pragma mark - 路径总和 II
/**
 * No113. 路径总和 II
 *
 * 给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径
 *
 */


@end
