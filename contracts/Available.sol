// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Available {
    enum Availability { Free, Taken }
    Availability public isAvailable = Availability.Free;
    address public takenBy;

    modifier markAsTaken(address _takenBy) {
        require(isAvailable == Availability.Free, "Already Taken!");
        isAvailable = Availability.Taken;
        takenBy = _takenBy;
        _;
    }

    modifier releasedByTaker(address _releaser) {
        require(takenBy == _releaser, "You don't have it!");
        _;
    }
}

