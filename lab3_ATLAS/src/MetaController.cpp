  
// #include "MetaController.h"
// use namespace std

// namespace ramulator{
//   void  commit_re_rank(vector<Controller<T>*> ctrls){
//        commit_as(ctrls);
//        sort_rank();
//        distribute_rank(ctrls);
//     }
//     void sort_rank(){
//         typedef function<bool(pair<int, float>, pair<int, float>)> Comparator; 
// 	    Comparator compFunctor =
// 			[](pair<int, float> elem1 ,pair<int, float> elem2)
// 			{
// 				return elem1.second < elem2.second;
// 			};
 
// 	    set<pair<int, float>, Comparator> rankset(
// 			total_as.begin(), total_as.end(), compFunctor);
 
//         int i = 0;
// 	    for (pair<int, float> element : rankset){
//             rank.insert(pair<element.first,i>);
//             i++;
//         }
//     }

//     void commit_as( vector<Controller<T>*> ctrls){
//         map<int,int> &as;
//         map<int,int>::iterator itr;
//         for(auto &ctrl : ctrls){
//            as = ctrl->get_as();
//            for(auto &elem :as){
//                itr = AS.find(as.first);
//                if(itr == AS.end()){
//                   AS[as.first] = 0;    
//                }
//                AS[as.first] += as.second;
//            }
//         }

//         for(auto &elem : AS){
//             itr = total_as.find(elem.first);
//             if(itr == total_as.end()){
//                 total_as[elem.first] = elem.second * (1-alpha);
//             }else{
//                 total_as[elem.first] = total_as[elem.first]*(alpha) + elem.second * (1-alpha);
//             }
//         }
//     }
//     void distribute_rank(vector<Controller<T>*> ctrls){
//          for(auto &ctrl : ctrls){
//              ctrl->set_rank(rank);
//          }
//     }
// }