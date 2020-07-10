#ifndef __METACONTROLLER_H
#define __METACONTROLLER_H

#include "Config.h"
#include "Controller.h"
#include "SpeedyController.h"
#include <iostream>
#include <vector>
#include <set>
#include <functional>
#include <cmath>
#include <cassert>
#include <tuple>

using namespace std;
namespace ramulator
{
template <class T, template<typename> class Controller = Controller >
class MetaController{

public:
    float alpha = 0.875f;
    //int T = 10*quantum;
    int quantum = 10000000;
    int clear_cycle_left = quantum;
    map<int,float> total_as;
    map<int,int> AS; //<pid,attained service>
    map<int,int> rank; //<pid,rank>
    //MetaController(){}
    bool clearCycleDec(){
        clear_cycle_left--;
        if(clear_cycle_left == 0){
            clear_cycle_left = quantum;
            return true;
        }
        return false;
    }
    void commit_re_rank(vector<Controller<T>*> ctrls){
        map<int,int> as;
        map<int,int>::iterator itr;
        for(auto &ctrl : ctrls){
           as = ctrl->get_as();
           for(auto &elem :as){
               itr = AS.find(elem.first);
               if(itr == AS.end()){
                  AS[elem.first] = 0;    
               }
               AS[elem.first] += elem.second;
           }
        }
        map<int,float>::iterator itr2;
        for(auto &elem : AS){
            itr2 = total_as.find(elem.first);
            if(itr2 == total_as.end()){
                total_as[elem.first] = elem.second * (1-alpha);
            }else{
                total_as[elem.first] = total_as[elem.first]*(alpha) + elem.second * (1-alpha);
            }
        }
        // for(auto &elem: total_as){
        //     cout<<elem.second;
        //     cout<<" ";
        // }

        // sort
        typedef function<bool(pair<int, float>, pair<int, float>)> Comparator; 
	    Comparator compFunctor =
			[](pair<int, float> elem1 ,pair<int, float> elem2)
			{
				return elem1.second < elem2.second;
			};
 
	    set<pair<int, float>, Comparator> rankset(
			total_as.begin(), total_as.end(), compFunctor);
 
        int i = 0;
	    for (pair<int, float> elem : rankset){
            
            rank[elem.first] = i;
            //rank.insert(pair<int,int>(element.first,i));
            i++;
        }
        //cout<<"\n";
        // distribute
        for(auto &ctrl : ctrls){
             ctrl->set_rank(rank);
        }
    }	
};
}

#endif /*__METACONTROLLER_H*/
