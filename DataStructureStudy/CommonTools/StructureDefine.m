//
//  StructureDefine.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/3/19.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "StructureDefine.h"
#import "DJQueue.h"

#pragma mark - 链表
ListNode * nodeFromArray(int * array, int size)
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

void printListNode(ListNode * head)
{
    if (!head) {
        printf("NULL");
        return;
    }
    while (head) {
        printf("%d %s", head->value, head->next != NULL ? "->" : "");
        head = head->next;
    }
}


#pragma mark - 树
int * covertStrToIntArray(char * str, int start, int end, int * returnSize) {
    if (!str || start > end) return NULL;
    
    int len = end - start;
    int * array = malloc(sizeof(int) * len);
    
    for (int i = start; i < end;) {
        char * p = str + i;
        // 过滤 ,
        if (*p == ',') {
            i ++;
            continue;
        }
        
        // 截取对应的数字字符串
        while (*p != '\0' && *p != ',') {
            p ++;
        }
        int subLen = (int)(p - str) - i;
        char * subStr = malloc(sizeof(char) * (subLen + 1));
        strncpy(subStr, str + i, subLen);
        subStr[subLen] = '\0';
        // 经对应的字符串赋值给array
        if (!strcmp(subStr, "#")) {
            *(array + *returnSize) = '#';
        }
        else {
            *(array + *returnSize) = atoi(subStr);
        }
        (*returnSize)++;
        i += subLen;
        // 回收临时内存
        free(subStr);
    }
    return array;
}

/**
 *
 * "[1,  #, 2,  #, 3]"
 */
TreeNode * treeFromStringArray(char * str) {
    if (!str || (str && strlen(str) < 3)) return NULL;
    
    int len = (int)strlen(str);
    // 将输入转化成 int 数组
    int size = 0;
    int * array = covertStrToIntArray(str, 1, len - 1, &size);
    
    DJQueue * queue = [[DJQueue alloc] init];
    TreeNode * root = malloc(sizeof(TreeNode));
    root->value = array[0];
    root->pLeft = NULL;
    root->pRight = NULL;
    [queue enqueue:root];

    for (int i = 1; i < size; i ++) {
        TreeNode * node = queue.dequeue;
        node->pLeft = NULL;
        node->pRight = NULL;
        if (array[i] != '#') {
            TreeNode * left = malloc(sizeof(TreeNode));
            left->value = array[i];
            left->pLeft = NULL;
            left->pRight = NULL;
            node->pLeft = left;
            [queue enqueue:left];
        }
        if (++i < size && array[i] != '#') {
            TreeNode * right = malloc(sizeof(TreeNode));
            right->value = array[i];
            right->pLeft = NULL;
            right->pRight = NULL;
            node->pRight = right;
            [queue enqueue:right];
        }
    }
    // 释放int数组
    free(array);
    return root;
}
