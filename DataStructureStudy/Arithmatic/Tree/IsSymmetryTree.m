//
//  IsSymmetryTree.m
//  MyStudy
//
//  Created by jolin.ding on 2019/12/18.
//  Copyright © 2019 jolin. All rights reserved.
//

#import "IsSymmetryTree.h"
#import "StructureDefine.h"
#import "DJStack.h"

@implementation IsSymmetryTree

- (instancetype)init
{
    if (self = [super init]) {
        /*
                    8
                  /   \
                 6     6
                / \   / \
               5   7 7   5
         */
        TreeNode * tree = treeFromStringArray("[8,6,6,5,7,7,5]");
        
        bool isSymmetry = isSymmetryTree(tree);
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


#pragma mark - 迭代法
bool noneRecusiveisSymmetricTree(TreeNode * tree) {
    
    if (!tree) return true;
    
    DJStack * stack = [[DJStack alloc] init];
    [stack push:tree->pLeft];
    [stack push:tree->pRight];
    
    while (!stack.empty) {
        TreeNode *  rightTree = stack.pop;
        TreeNode * leftTree = stack.pop;
        if (!rightTree && !leftTree) return true;
        if (!rightTree || !leftTree || rightTree->value != leftTree->value) return false;
        
        [stack push:rightTree->pLeft];
        [stack push:leftTree->pRight];
        [stack push:rightTree->pRight];
        [stack push:leftTree->pLeft];
    }
    
    return true;
}

@end
