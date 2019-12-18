//
//  IsSymmetryTree.m
//  MyStudy
//
//  Created by jolin.ding on 2019/12/18.
//  Copyright © 2019 jolin. All rights reserved.
//

#import "IsSymmetryTree.h"
#import "StructureDefine.h"

@implementation IsSymmetryTree

- (instancetype)init
{
    if (self = [super init]) {
        
        TreeNode * tree1 = malloc(sizeof(TreeNode));
        tree1->pLeft = NULL;
        tree1->pRight = NULL;
        tree1->value = 8;
        
        TreeNode * leftTree = malloc(sizeof(TreeNode));
        leftTree->value = 6;
        leftTree->pLeft = NULL;
        leftTree->pRight = NULL;
        tree1->pLeft = leftTree;

        TreeNode * rightTree = malloc(sizeof(TreeNode));
        rightTree->value = 6;
        rightTree->pLeft = NULL;
        rightTree->pRight = NULL;
        tree1->pRight = rightTree;

        TreeNode * leftTree1 = malloc(sizeof(TreeNode));
        leftTree1->value = 5;
        leftTree1->pLeft = NULL;
        leftTree1->pRight = NULL;
        leftTree->pLeft = leftTree1;
        
        TreeNode * rightTree1 = malloc(sizeof(TreeNode));
        rightTree1->value = 7;
        rightTree1->pLeft = NULL;
        rightTree1->pRight = NULL;

        leftTree->pRight = rightTree1;

        TreeNode * leftTree2 = malloc(sizeof(TreeNode));
        leftTree2->value = 7;
        leftTree2->pLeft = NULL;
        leftTree2->pRight = NULL;
        rightTree->pLeft = leftTree2;

        TreeNode * rightTree2 = malloc(sizeof(TreeNode));
        rightTree2->value = 5;
        rightTree2->pLeft = NULL;
        rightTree2->pRight = NULL;
        rightTree->pRight = rightTree2;
        
        bool isSymmetry = isSymmetryTree(tree1);
        printf("\n------------ IsSymmetryTree ------------\n\n");
        printf("%s\n", isSymmetry ? "true" : "false");
        
        
    }
    return self;
}


/// 对称二叉树
///
/// 如果一颗二叉树和它的镜像一样，那么它是对称的，实现一个函数，用来判断一颗二叉树是不是对称的
///
/// @param tree 二叉树的根节点
bool isSymmetryTree(TreeNode * tree)
{
    if (!tree) return true;
    return isSymmetric(tree->pLeft, tree->pRight);
}

bool isSymmetric(TreeNode * leftTree, TreeNode * rightTree)
{
    if (!leftTree && !rightTree) return true;
    if (!leftTree || !rightTree || (leftTree->value != rightTree->value)) return false;
    
    return isSymmetric(leftTree->pLeft, rightTree->pRight) && isSymmetric(leftTree->pRight, rightTree->pLeft);
}

@end
