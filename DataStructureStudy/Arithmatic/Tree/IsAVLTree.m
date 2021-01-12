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
        
        TreeNode * tree = treeFromStringArray("[3,9,20,#,#,15,7,#,#,#,8]");
        
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
