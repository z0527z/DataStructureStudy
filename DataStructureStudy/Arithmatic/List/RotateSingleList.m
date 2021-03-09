//
//  RotateSingleList.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/3/9.
//  Copyright © 2021 jolin. All rights reserved.
//

#import "RotateSingleList.h"
#import "StructureDefine.h"

@implementation RotateSingleList

- (instancetype)init {
    if (self = [super init]) {
        
        int array[] = {1, 2, 3, 4, 5};
        int size = sizeof(array) / sizeof(array[0]);
        ListNode * head = nodeFromArray(array, size);
        printf("\n------------- RotateSingleList -----------\n\n");
        int n = 3;
        printf("input: ");
        printListNode(head);
        printf("\n");
        
        rotateSingleList(&head, n);
        printf("output: ");
        printListNode(head);
        printf("\n");
    }
    return self;
}

/**
 * 给定一个单链表，给定一个值 n ，求链表关于 n 的旋转链表
 *
 *
 * 1 -> 2 ->  3 -> 4 -> 5        n = 3
 *
 * 4 -> 5 -> 1 -> 2 -> 3
 *
 */
void rotateSingleList(ListNode ** head, int n) {
    if (!head || !*head || n <= 0) return;
    
    // 计算链表的长度
    ListNode * p = *head;
    int i = 0;
    while (p) {
        p = p->next;
        i ++;
    }
    p = *head;
    
    // 确定 i 和 n 的关系
    int j = n;
    if (i < n) {
        j = n % i;
    }
    // 遍历到 n 的位置
    ListNode * p1 = *head;
    for (int k = 0; k < j - 1; k ++) {
        p1 = p1->next;
    }
    // 保留 n 的位置
    ListNode * p2 = p1;
    // 遍历到链表尾部
    while (p1->next) {
        ListNode * temp = p1;
        p1 = p1->next;
    }
    // 连接链表尾部跟头部
    p1->next = p;
    // 更改新头部的地址
    *head = p2->next;
    // 新的尾部置空
    p2->next = NULL;
}

@end
