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
        
        TreeNode * tree = malloc(sizeof(TreeNode));
        tree->value = 1;
        
        TreeNode * left1 = malloc(sizeof(TreeNode));
        left1->value = 2;
        tree->pLeft = left1;
        
        TreeNode * right1 = malloc(sizeof(TreeNode));
        right1->value = 3;
        tree->pRight = right1;
        
        TreeNode * left2 = malloc(sizeof(TreeNode));
        left2->value = 4;
        left2->pLeft = NULL;
        left2->pRight = NULL;
        left1->pLeft = left2;
        
        TreeNode * right2 = malloc(sizeof(TreeNode));
        right2->value = 5;
        right2->pLeft = NULL;
        right2->pRight = NULL;
        left1->pRight = right2;
        
        TreeNode * left3 = malloc(sizeof(TreeNode));
        left3->value = 6;
        left3->pLeft = NULL;
        left3->pRight = NULL;
        right1->pLeft = left3;
        
        TreeNode * right3 = malloc(sizeof(TreeNode));
        right3->value = 7;
        right3->pLeft = NULL;
        right3->pRight = NULL;
        right1->pRight = right3;
        
        printf("\n-------- findTreePathEqualToAnInteger --------\n\n");
        findTreePathEqualToAnInteger(tree, 8);
        
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

@end
