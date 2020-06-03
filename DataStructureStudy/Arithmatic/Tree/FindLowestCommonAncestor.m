//
//  FindLowestCommonAncestor.m
//  DataStructureStudy
//
//  Created by jolin on 2020/6/3.
//  Copyright © 2020年 jolin. All rights reserved.
//

#import "FindLowestCommonAncestor.h"
#import "StructureDefine.h"

@implementation FindLowestCommonAncestor

- (instancetype)init
{
    if (self = [super init]) {
        
        // 构造一棵二叉树
        BinaryTree * rootNode = malloc(sizeof(BinaryTree));
        rootNode->value = 1;
        rootNode->pParrent = NULL;
        
        BinaryTree * left1 = malloc(sizeof(BinaryTree));
        left1->value = 2;
        left1->pParrent = rootNode;
        rootNode->pLeft = left1;
        
        BinaryTree * right1 = malloc(sizeof(BinaryTree));
        right1->value = 3;
        right1->pParrent = rootNode;
        rootNode->pRight = right1;
        
        BinaryTree * left2 = malloc(sizeof(BinaryTree));
        left2->value = 4;
        left2->pParrent = left1;
        left2->pRight = NULL;
        left2->pLeft = NULL;
        left1->pLeft = left2;
        
        BinaryTree * right2 = malloc(sizeof(BinaryTree));
        right2->value = 5;
        right2->pParrent = left1;
        right2->pRight = NULL;
        right2->pLeft = NULL;
        left1->pRight = right2;
        
        BinaryTree * left3 = malloc(sizeof(BinaryTree));
        left3->value = 6;
        left3->pParrent = right1;
        right1->pLeft = left3;
        
        BinaryTree * right3 = malloc(sizeof(BinaryTree));
        right3->value = 7;
        right3->pParrent = right1;
        right3->pRight = NULL;
        right1->pRight = right3;
        
        BinaryTree * left4 = malloc(sizeof(BinaryTree));
        left4->value = 8;
        left4->pParrent = right3;
        left4->pLeft = NULL;
        left4->pRight = NULL;
        
        right3->pLeft = left4;
    }
    return self;
}

void findLowestCommonAncestor(BinaryTree * node1, BinaryTree * node2)
{
    
}

@end
