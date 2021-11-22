// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract MaizeInsurance {

    /*
        * Main Variables *
        policy {
            - client_id: unsigned integer
            - policy_id: unsigned integer
            - maize_variety: string
            - start_date: uint256 => because we use epoch time
            - end_date: uint256
        } - struct
        - buyers_address: address
        - sellers_address: adress
    */
    
    address payable public client;
    address payable public insurer;
    
    struct Policy{
        uint client_id;
        uint policy_id;
        string maize_variety;
        uint256 start_date;
        uint256 end_date;
    }
    
    struct Variety{
        string variety_name;
        uint[2] acceptable_monthly_rain_avgs;
        uint[2] acceptable_monthly_temp_avgs;
        uint[2] acceptable_weekly_rain_avgs;
        uint[2] acceptable_weekly_temp_avgs;
    }
    
    Policy[] policies;
    Variety[] varieties; //this will hold all the threshold data for the different varieties 


    /*
        * Main Functions *
        - constructor () => Initialize a new contract
        - validate () => Validate that thresholds were met
        
        * Accessor Functions*
        -get_policy
        
        * Mutation Functions*
        -set_policy
    */
    
    // constructor() {
    //     policy = Policy(1, 1, "Hybrid Series 5", 1606063665, 1611334065);
    // }
    
    function get_policy() public view returns(Policy[] memory){
        return policies;
    }
    
    function add_policy(Policy memory _policy) public{
        policies.push(
            Policy(_policy.client_id, _policy.policy_id, _policy.maize_variety, _policy.start_date, _policy.end_date) 
        );
    }
    
    // function validate(uint current_date) public returns (
    //     bool validate
    //     ){
        
    // }
  
}