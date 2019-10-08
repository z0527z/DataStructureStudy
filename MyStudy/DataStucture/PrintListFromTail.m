//
//  PrintListFromTail.m
//  MyStudy
//
//  Created by jolin on 2019/10/1.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "PrintListFromTail.h"
#import "StructureDefine.h"
#import "DJStack.h"

@implementation PrintListFromTail

- (instancetype)init
{
    if (self = [super init]) {
        
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
        
        printListFromTail(head);
    }
    return self;
}

void printListFromTail(ListNode * node)
{
    if (!node) return;
    
    DJStack * stack = [[DJStack alloc] init];
    ListNode * head = node;
    
    while (head) {
        [stack push:head];
        head = head->next;
    }
    
    printf("\n--------- PrintListFromTail ---------\n\n");
    while (!stack.empty) {
        ListNode * p = stack.pop;
        printf("%d ", p->value);
    }
    printf("\n");
}

@end
