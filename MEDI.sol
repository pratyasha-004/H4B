// SPDX license identifier specified: UNLICENSED

pragma solidity ^0.8.0;

contract PatientRecord {
    
   
    struct Patient {
        string name;
        string bloodGroup;
        string allergies;
        string history;
        string[] documents;
        bool exists;
    }

    mapping(string => Patient) private patients;

   
    address public owner;

  
    constructor() {
        owner = msg.sender;
    }

   
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can access this function.");
        _;
    }

   
    function setPatient(
        string memory _id,
        string memory _name,
        string memory _bloodGroup,
        string memory _allergies,
        string memory _history,
        string[] memory _documents
    ) public onlyOwner {
        patients[_id] = Patient(_name, _bloodGroup, _allergies, _history, _documents, true);
    }

   
    function getPatient(string memory _id)
        public
        view
        returns (
            string memory name,
            string memory bloodGroup,
            string memory allergies,
            string memory history,
            string[] memory documents
        )
    {
        require(patients[_id].exists, "Patient does not exist.");
        Patient memory p = patients[_id];
        return (p.name, p.bloodGroup, p.allergies, p.history, p.documents);
    }
}
