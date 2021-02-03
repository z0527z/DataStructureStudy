//
//  FindLongestRepeatedSubString.m
//  DataStructureStudy
//
//  Created by jolin on 2020/12/5.
//  Copyright © 2020年 jolin. All rights reserved.
//

#import "FindLongestRepeatedSubString.h"

@implementation FindLongestRepeatedSubString

- (instancetype)init {
    if (self = [super init]) {
        
        char * str = "aaaaabbb";
//        char * subStr = findLongestRepeatedSubString(str);
        printf("\n---------- FindLongestRepeatedSubString ---------\n\n");
//        printf("subString:%s\n", subStr);
//        if (subStr) {
//            free(subStr);
//        }
        testSuffixTree(str);
    }
    return self;
}

bool isEqual(char * str1, char * str2) {
    if (!str1) return str2 == NULL;
    if (!str2) return false;
    
    char * p1 = str1;
    char * p2 = str2;
    
    bool equal = true;
    while (*p1 != '\0' && *p2 != '\0') {
        if (*p1 == *p2) {
            p1 ++;
            p2 ++;
        }
        else {
            equal = false;
            break;
        }
    }
    return equal;
}
// 暴力法
char * findLongestRepeatedSubString(char * str) {
    if (!str || strlen(str) <= 1) return NULL;
    
    
    int len = (int)strlen(str);
    char * lastSubString = NULL;
    
    char * tempStr = malloc(len + 1);
    int maxLen = 1, pos = 0, count = 0;
    // 从长度1开始，依次截取子串进行比较
    for (int i = 1; i < len; i ++) {
        for (int j = 0; j < len - i - 1; j ++) {
            strncpy(tempStr, str + j, i + 1);
            tempStr[i + 1] = '\0';
            for (int k = 0, count = 0; k < len - i; k ++) {
                if (strncmp((str + k), tempStr, i + 1) ==  0) {
                    count ++;
                    if (count != 1) {
                        if (i >= maxLen) {
                            maxLen = i + 1;
                            pos = k;
                        }
                    }
                }
            }
        }
    }
    free(tempStr);
    char * subStr = malloc(maxLen + 1);
    strncpy(subStr, str + pos, maxLen);
    subStr[maxLen] = '\0';
    return subStr;
}

#pragma mark - 后缀数组


#pragma mark - 后缀树
#define MAX_CHAR 256
typedef struct SuffixTreeNode {
    struct SuffixTreeNode * children[MAX_CHAR];
    
    struct SuffixTreeNode * suffixLink;
    
    int start, *end;
    
    int suffixIndex;
}Node;

char text[100];
Node * root = NULL;

Node * lastNewNode = NULL;
Node * activeNode = NULL;
int count = 0;

int activeEdge = -1;
int activeLength = 0;

int remainingSuffixCount = 0;
int leafEnd = -1;
int * rootEnd = NULL;
int * splitEnd = NULL;
int size = -1;


Node * node(int start, int * end) {
    count++;
    Node * node = (Node *)malloc(sizeof(Node));
    int i;
    for (i = 0; i < MAX_CHAR; i ++) {
        node->children[i] = NULL;
    }
    
    node->suffixLink = root;
    node->start = start;
    node->end = end;
    
    node->suffixIndex = -1;
    return node;
}

int edgeLength(Node * n) {
    return *(n->end) - (n->start) + 1;
}

int walkDown(Node *currNode) {
    if (activeLength >= edgeLength(currNode)) {
        activeEdge = (int)text[activeEdge + edgeLength(currNode)] - (int)' ';
        activeLength -= edgeLength(currNode);
        activeNode = currNode;
        return 1;
    }
    return 0;
}

void extendSuffixTree(int pos) {
    // rule 1
    leafEnd = pos;
    
    remainingSuffixCount ++;
    
    lastNewNode = NULL;
    
    while (remainingSuffixCount > 0) {
        if (activeLength == 0) {
            // APCFALZ
            activeEdge = (int)text[pos] - (int)' ';
        }
        
        if (activeNode->children[activeEdge] == NULL) {
            activeNode->children[activeEdge] = node(pos, &leafEnd);
            
            if (lastNewNode != NULL) {
                lastNewNode->suffixLink = activeNode;
                lastNewNode = NULL;
            }
        }
        else {
            Node * next = activeNode->children[activeEdge];
            if (walkDown(next)) {
                continue;
            }
            
            if (text[next->start + activeLength] == text[pos]) {
                if (lastNewNode != NULL && activeNode != root) {
                    lastNewNode->suffixLink = activeNode;
                    lastNewNode = NULL;
                }
                activeLength ++;
                break;
            }
            
            splitEnd = (int *)malloc(sizeof(int));
            *splitEnd = next->start + activeLength - 1;
            
            Node * split = node(next->start, splitEnd);
            activeNode->children[activeEdge] = split;
            
            split->children[(int)text[pos] - (int)' '] = node(pos, &leafEnd);
            next->start += activeLength;
            split->children[activeEdge] = next;
            
            if (lastNewNode != NULL) {
                lastNewNode->suffixLink = split;
            }
            
            lastNewNode = split;
        }
        
        remainingSuffixCount --;
        if (activeNode == root && activeLength > 0) {
            activeLength --;
            activeEdge = (int)text[pos - remainingSuffixCount + 1] - (int)' ';
        }
        //APCFER2C2
        else if (activeNode != root) {
            activeNode = activeNode->suffixLink;
        }
    }
}

void print(int i, int j) {
    int k;
    for (k = i; k <= j; k ++) {
        printf("%c", text[k]);
    }
}

void setSuffixIndexByDFS(Node * n, int labelHeight) {
    if (n == NULL) return;
    
    if (n->start != -1) {
        print(n->start, *(n->end));
    }
    int leaf = 1;
    int i;
    for (i = 0; i < MAX_CHAR; i ++) {
        if (n->children[i] != NULL) {
            if (leaf == 1 && n->start != -1) {
                printf(" [%d]\n", n->suffixIndex);
                
                leaf = 0;
                setSuffixIndexByDFS(n->children[i], labelHeight + edgeLength(n->children[i]));
            }
        }
    }
    if (leaf == 1) {
        n->suffixIndex = size - labelHeight;
        printf(" [%d]\n", n->suffixIndex);
    }
}

void freeSuffixTreeByPostOrder(Node * n) {
    if (n == NULL) return;
    int i;
    for (i = 0; i < MAX_CHAR; i++)
    {
        if (n->children[i] != NULL)
        {
            freeSuffixTreeByPostOrder(n->children[i]);
        }
    }
    if (n->suffixIndex == -1) {
        free(n->end);
    }
    free(n);
}

void buildSuffixTree() {
    size = (int)strlen(text);
    int i;
    rootEnd = (int *)malloc(sizeof(int));
    *rootEnd = -1;
    
    root = node(-1, rootEnd);
    activeNode = root;
    
    for (i = 0; i < size; i ++) {
        extendSuffixTree(i);
    }
    
    int labelHeight = 0;
    setSuffixIndexByDFS(root, labelHeight);
    
    // free
//    freeSuffixTreeByPostOrder(root);
}

void testSuffixTree(char * str) {
    strcpy(text, "abbc");
    buildSuffixTree();
}




@end
