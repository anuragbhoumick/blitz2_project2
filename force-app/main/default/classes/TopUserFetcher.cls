/**
 * TopUserFetcher - A class to retrieve the top 10 users from Salesforce
 * 
 * @author Work Item WI-000000068
 */
public with sharing class TopUserFetcher {
    
    /**
     * Gets the top 10 most recently created active users
     * 
     * @return List<User> A list of User records, limited to 10
     */
    public static List<User> getTopUsers() {
        return [
            SELECT Id, Name, Username, Email, IsActive, ProfileId, Profile.Name, CreatedDate
            FROM User
            WHERE IsActive = true
            ORDER BY CreatedDate DESC
            LIMIT 20
        ];
    }
    
    /**
     * Gets top users by specific criteria
     * 
     * @param criteria The field to sort by (default is CreatedDate)
     * @param isAscending Whether to sort in ascending order (default is false - descending)
     * @return List<User> A list of User records, limited to 10
     */
    public static List<User> getTopUsersByCriteria(String criteria, Boolean isAscending) {
        String sortOrder = isAscending ? 'ASC' : 'DESC';
        String queryString = 'SELECT Id, Name, Username, Email, IsActive, ProfileId, Profile.Name, CreatedDate ' +
                            'FROM User ' +
                            'WHERE IsActive = true ' +
                            'ORDER BY ' + String.escapeSingleQuotes(criteria) + ' ' + sortOrder + ' ' +
                            'LIMIT 10';
        
        return Database.query(queryString);
    }
}
