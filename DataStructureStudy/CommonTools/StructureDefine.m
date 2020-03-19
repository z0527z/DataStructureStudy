//
//  StructureDefine.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/3/19.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "StructureDefine.h"


ListNode * constructList(int * array, int size)
{
    if (!array || size <= 0) return NULL;
    ListNode * head = NULL;
    ListNode * p = NULL;
    for (int i = 0; i < size; i ++) {
        ListNode * node = nodeFromValue(array[i]);
        if (!head) {
            head = node;
            p = head;
        }
        else {
            p->next = node;
            p = p->next;
        }
    }
    return head;
}

ListNode * nodeFromValue(int value)
{
    ListNode * node = malloc(sizeof(ListNode));
    node->value = value;
    node->next = NULL;
    return node;
}

