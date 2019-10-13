//
//  HasSubTree.m
//  MyStudy
//
//  Created by jolin.ding on 2019/10/10.
//  Copyright © 2019 jolin. All rights reserved.
//

#import "HasSubTree.h"
#import "StructureDefine.h"

@implementation HasSubTree

- (instancetype)init
{
    if (self = [super init]) {
        TreeNode * tree1 = malloc(sizeof(TreeNode));
        tree1->value = 8;
        
        TreeNode * leftTree = malloc(sizeof(TreeNode));
        leftTree->value = 8;
        tree1->pLeft = leftTree;
        
        TreeNode * rightTree = malloc(sizeof(TreeNode));
        rightTree->value = 7;
        tree1->pRight = rightTree;
        
        TreeNode * leftTree1 = malloc(sizeof(TreeNode));
        leftTree1->value = 9;
        leftTree1->pLeft = NULL;
        leftTree1->pRight = NULL;
        leftTree->pLeft = leftTree1;
        
        TreeNode * rightTree1 = malloc(sizeof(TreeNode));
        rightTree1->value = 2;
        rightTree1->pLeft = NULL;
        rightTree1->pRight = NULL;
        leftTree->pRight = rightTree1;
        
        
        TreeNode * tree2 = malloc(sizeof(TreeNode));
        tree2->value = 8;
        
        TreeNode * leftTree2 = malloc(sizeof(TreeNode));
        leftTree2->value = 9;
        leftTree2->pLeft = NULL;
        leftTree2->pRight = NULL;
        tree2->pLeft = leftTree2;
        
        TreeNode * rightTree2 = malloc(sizeof(TreeNode));
        rightTree2->value = 2;
        rightTree2->pLeft = NULL;
        rightTree2->pRight = NULL;
        tree2->pRight = rightTree2;
        
        int flag = hasSubTree(tree1, tree2);
        
        printf("\n------------- HasSubTree -------------\n\n");
        printf("%d\n", flag);
        
    }
    return self;
}

bool hasSubTree(TreeNode * tree1, TreeNode * tree2)
{
    int flag = 0;
    if (!tree1 || !tree2) return flag;
    
    if (tree1->value == tree2->value) {
        flag = doesTree1HasTree2(tree1, tree2);
    }
    if (!flag) {
        flag = hasSubTree(tree1->pLeft, tree2);
    }
    if (!flag) {
        flag = hasSubTree(tree1->pRight, tree2);
    }
    
    return flag;
}

bool doesTree1HasTree2(TreeNode * tree1, TreeNode * tree2)
{
    if (!tree2) return 1;
    if (!tree1) return 0;
    
    if (tree1->value != tree2->value) return 0;
    
    return doesTree1HasTree2(tree1->pLeft, tree2->pLeft) && doesTree1HasTree2(tree1->pRight, tree2->pRight);
}

@end
