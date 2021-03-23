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
        
        /*
                    8
                  /   \
                 8     7
                / \
               9   2
         
         
                     8
                   /   \
                  9     2
         */
        TreeNode * tree1 = treeFromStringArray("[8,8,7,9,2]");
        
        TreeNode * tree2 = treeFromStringArray("[8,9,2]");
        bool flag = hasSubTree(tree1, tree2);
        
        printf("\n------------- HasSubTree -------------\n\n");
        printf("%s\n", flag ? "true" : "false");
        
        freeTree(tree1);
        freeTree(tree2);
        
    }
    return self;
}

bool hasSubTree(TreeNode * tree1, TreeNode * tree2)
{
    bool flag = false;
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
    if (!tree2) return true;
    if (!tree1) return false;
    
    if (tree1->value != tree2->value) return false;
    
    return doesTree1HasTree2(tree1->pLeft, tree2->pLeft) && doesTree1HasTree2(tree1->pRight, tree2->pRight);
}

@end
