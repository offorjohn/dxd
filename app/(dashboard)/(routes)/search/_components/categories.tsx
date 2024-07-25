"use client";

import { Category } from "@prisma/client";

import {
    FcEngineering,
    FcFilmReel,
    FcMultipleDevices,
    FcMusic,
    FcOldTimeCamera,
    FcSalesPerformance,
    FcSportsMode
} from "react-icons/fc";
import { IconType } from "react-icons/lib";
import { CategoryItem } from "./category-item";
  
 
interface CategoriesProps{
     items: Category[];
}
const iconMap: Record<Category["name"],IconType> = {
    "Music": FcMusic,
    "Photography": FcOldTimeCamera,
    "Fitness": FcSportsMode,
    "Accounting": FcSalesPerformance,
    "Computer Science": FcMultipleDevices,
    "Filming": FcFilmReel,
    "Engineering": FcEngineering,
}

export const Categories = ({
    items,
 } : CategoriesProps) => {
    return (
        <div className="flex item-center gap-x-2 overflow-y-auto pb-2">

            {items.map((item) => (

                <CategoryItem
                  key={item.id}
                  label={item.name}
                  icon={iconMap[item.name]}
                  value={item.id}
                  />
            ))} 
        </div>
    )
}

