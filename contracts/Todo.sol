// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoApp {
    uint256 num = 0;

    struct Todo {
        uint256 taskid;
        string task;
        bool flag;
    }

    Todo[] public todoList;

    mapping(uint256 => address) public todoToOwner;
    mapping(address => uint256) public ownerTodoCount;

    function createTodo(string memory _task) public {
        todoList.push(Todo(num, _task, true));
        uint256 id = todoList.length - 1;
        todoToOwner[id] = msg.sender;
        ownerTodoCount[msg.sender]++;
        num++;
    }

    function getTodoListByOwner(address owner)
        external
        view
        returns (uint256[] memory)
    {
        uint256[] memory result = new uint256[](ownerTodoCount[owner]);
        uint256 counter = 0;
        for (uint256 i = 0; i < todoList.length; i++) {
            if (todoToOwner[i] == owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }
}
