//
//  ReverseList.m
//  MyStudy
//
//  Created by jolin.ding on 2019/10/8.
//  Copyright © 2019 jolin. All rights reserved.
//

#import "ReverseList.h"
#import "StructureDefine.h"

@implementation ReverseList

- (instancetype)init
{
    if (self = [super init]) {
        
        // 构造链表
        ListNode * head = malloc(sizeof(ListNode));
        head->value = 1;
        head->next = NULL;
        ListNode * p = head;
        for (int index = 0; index < 10; index ++) {
            ListNode * temp = malloc(sizeof(ListNode));
            temp->value = index + 2;
            temp->next = NULL;
            p->next = temp;
            p = p->next;
        }
        
        ListNode * list = reverseList(head);
        
        printf("\n--------- ReverseList ---------\n\n");
        while (list) {
            printf("%d ", list->value);
            list = list->next;
        }
        printf("\n");
        
    }
    return self;
}


/// 面试题16: 反转链表
///         定义一个函数，输入一个链表的头结点，反转该链表并输出反转后链表的头结点
///
/// @param head 输入链表的头结点
/// @return 返回反转后链表的头结点
ListNode * reverseList(ListNode * head)
{
    ListNode * p = head;
    ListNode * reverseHead = NULL;
    while (p) {
        ListNode * tempNode = p;
        p = p->next;
        tempNode->next = reverseHead;
        reverseHead = tempNode;
    }
    return reverseHead;
}

@end
