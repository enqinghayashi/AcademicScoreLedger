// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract MyContract {
    address public owner;
    address public TA; // For our class teaching assistant(TA)

    mapping(address => uint8) private scores; // Record student scores

    constructor() { 
        owner = msg.sender; // Initialise the deployer as contract owner
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call");
        _;
    }

    modifier onlyTA() {
        require(msg.sender == TA, "Only TA can call");
        _;
    }

    // Owner sets or updates the assistant address
    function setTA(address _TA) external onlyOwner {
        require(_TA != address(0), "Invalid address");
        TA = _TA;
    } // Potential improvement: support multiple TAs

    // TA records a student's score from 0 to 100
    function recordStudentScore(address _student, uint8 _score) external onlyTA {
        require(_student != address(0), "Invalid student address");
        require(_score <= 100, "Score must be between 0 and 100");
        scores[_student] = _score;
    }

    // Students can view their own score only
    function getMyScore() external view returns (uint8) {
        return scores[msg.sender];
    }

    // Owner transfers ownership
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid address, check the address then try again");
        owner = newOwner;
    }

    // Purpose for teacher(owner) and TA to read student scores
    function viewScore(address _student) external view returns (uint8) {
        require(
            msg.sender == owner || msg.sender == TA ,
            "You don't have access to this information"
        );
        return scores[_student];
    }
}
