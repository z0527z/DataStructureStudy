//
//  StructureDefine.h
//  MyStudy
//
//  Created by jolin on 2019/10/1.
//  Copyright © 2019年 jolin. All rights reserved.
//

#ifndef StructureDefine_h
#define StructureDefine_h


typedef struct ListNode {
    int value;
    struct ListNode * next;
}ListNode;


typedef struct TreeNode {
    int value;
    struct TreeNode * pLeft;
    struct TreeNode * pRight;
}TreeNode;

#endif /* StructureDefine_h */
