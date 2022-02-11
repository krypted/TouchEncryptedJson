# TouchEncryptedJson
Simple project that accepts an input and encrypts it with the TouchID on a Mac.

This is built on top of RNCryptor 5.1.0 and MacOS 12 - ymmv beyond that. The code is in the "Xcode Project" folder or available in the zip. 

From the header of the main swift:

//  Meant as a PoC so InputA and InputB would be joined into a field in a json document
//  The json document would then only be readable when TouchID was used to retrieve the ECC key
//  Could also store the contents of that json document in a single field in user defaults or 
//  instead use Core Storage/Keychain. However, for native mongo/nosql operations it is can be
//  cheaper to keep them in natitve json.
