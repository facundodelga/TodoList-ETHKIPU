// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract ToDoList{
    struct Task{
        string description;
        uint256 timestamp;
        bool isCompleted;
    }

    Task[] public s_tasks;

    event ToDoList_SuccessCall(Task newTask);
    event ToDoList_SuccessCall(string description);

    function addTask(string memory _description) public{
        Task memory newTask = Task({
            description: _description,
            timestamp: block.timestamp,
            isCompleted: false
        });
        s_tasks.push(newTask);

        emit ToDoList_SuccessCall(newTask);
    }

    function getTask(uint256 _index) external view returns(Task memory _task){
        _task = s_tasks[_index];
    }

    function updateTask(uint256 _index) external  {
        s_tasks[_index].isCompleted = true;

        emit ToDoList_SuccessCall(s_tasks[_index]);
    }

    function deleteTask(string memory _description) external {
        uint256 length = s_tasks.length;

        for(uint256 i = 0; i < length; i++){
            if(keccak256(abi.encodePacked(_description)) == keccak256(abi.encodePacked(s_tasks[i].description))){
                s_tasks[i] = s_tasks[length - 1];
                s_tasks.pop();

                emit ToDoList_SuccessCall(_description);
			    return;
            }
        }
    }
    




}