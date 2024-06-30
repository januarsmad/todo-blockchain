// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface ITodo {
    struct Todo {
        uint256 id;
        string task;
        uint256 severity;
        bool isCompleted;
    }
}