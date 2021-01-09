//
//  IsAVLTree.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/1/9.
//  Copyright © 2021 jolin. All rights reserved.
//

#import "IsAVLTree.h"
#import "StructureDefine.h"

@implementation IsAVLTree

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
        
        bool isAVL = isAVLTree(tree);
        printf("\n------------- IsAVLTree ------------\n\n");
        printf("isAVL:%s\n", isAVL ? "true" : "false");
    }
    return self;
}

bool isAVLTree(TreeNode * tree) {
    if (!tree) return false;
    
    return getDepthOfTree(tree) == -1 ? false : true;
}

int getDepthOfTree(TreeNode * tree) {
    if (!tree) return 0;
    
    int leftDepth = getDepthOfTree(tree->pLeft);
    if (leftDepth == -1) return -1;
    
    int rightDepth = getDepthOfTree(tree->pRight);
    if (rightDepth == -1) return -1;
    
    int gap = abs(leftDepth - rightDepth);
    return gap > 1 ? -1 : MAX(leftDepth, rightDepth) + 1;
}

@end
