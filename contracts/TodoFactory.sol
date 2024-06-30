// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0 <0.9.0;
import "hardhat/console.sol";
import "./TodoInterface.sol";

contract TodoFactory {
    uint256 public todoCount;
    ITodo.Todo[] public todoList;

    mapping(uint256 => ITodo.Todo) public getTodoById;

    function createTodo(string memory _task, uint256 _severity) public {
        ITodo.Todo memory newData = ITodo.Todo({
            id: generateRandomNumber(),
            task: _task,
            severity: _severity,
            isCompleted: false
        });
        todoList.push(newData);
        getTodoById[generateRandomNumber()] =  newData;
        todoCount++;
    }

    function retrieveTodo(uint256 _todoIndex) public view returns(ITodo.Todo memory) {
        return todoList[_todoIndex];
    }

     function generateRandomNumber() internal view returns (uint256) {
        uint256 random = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % 90 + 10;
        return random;
    }

    function findTaskIndex(uint256 _id) public  view returns(bool isFound, uint256 index) {
        for(uint i = 0; i < todoList.length; i++) {
            if (todoList[0].id == _id) {
                return (true, i);
            }
        }

        return (false, 0);
    }

    function getTaskById(uint256 _id) public view returns(ITodo.Todo memory) {
        return getTodoById[_id];
    }

    function completeTask(uint256 _id) public {
        (bool isFound, uint index) = findTaskIndex(_id);

        if (isFound) {
            todoList[index].isCompleted = true;
        } else {
            console.log("TASK NOT FOUND!!!");
        }
    }
}